class User < ApplicationRecord
    has_and_belongs_to_many :skills
    has_and_belongs_to_many :users
    accepts_nested_attributes_for :skills, :reject_if => proc { |attributes| attributes['name'].blank?}

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
    self.first_name + " " + self.last_name
  elsif self.has_role? :charity
  self.business_name
  end
end

def full_address
  self.street << ", " << self.city << ", " << self.country << ", " << self.postcode.to_s
end

def assign_chosen_role
  self.add_role(self.chosen_role) if self.roles.blank?
end

def send_welcome_email
  ModelMailer.new_user_notification(self).deliver_now
end

end
