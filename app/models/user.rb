class User < ApplicationRecord
    has_and_belongs_to_many :skills
    has_and_belongs_to_many :users
    accepts_nested_attributes_for :skills, :reject_if => proc { |attributes| attributes['name'].blank?}
    validates :phone, numericality: { only_integer: true }
    validates :postcode, numericality: { only_integer: true }
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_chosen_role, :send_welcome_email

  mount_uploader :image, UserImageUploader
  geocoded_by :full_address
  after_validation :geocode


def full_name
  if self.has_role? :volunteer
  "#{first_name} #{last_name}".titleize
  elsif self.has_role? :charity
  "#{business_name}".titleize
  end
end


def full_address
  "#{street}, #{city}, #{country}, #{postcode.to_s}".titleize
end

def assign_chosen_role
  self.add_role(self.chosen_role) if self.roles.blank?
  if self.has_role? :volunteer
    self.volunteer_cap = 0
    self.job_cap = 0
    puts "Volunteer"
    self.save
    puts "Youre a volunteer"
  elsif self.has_role? :premium
    self.volunteer_cap = 8
    self.job_cap = 6
    puts "Premium"
    self.save
  elsif self.has_role? :charity
    self.volunteer_cap = 4
    self.job_cap = 3
    puts "Charity"
    self.save
    puts "Charity cap implemented"
  end
end

def send_welcome_email
  ModelMailer.new_user_notification(self).deliver_now
end

end
