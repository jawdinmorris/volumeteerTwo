class User < ApplicationRecord
    has_and_belongs_to_many :skills
    accepts_nested_attributes_for :skills, :reject_if => proc { |attributes| attributes['name'].blank?}
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_chosen_role


def full_name
  self.first_name << " " << self.last_name
end

def full_address
  self.street << ", " << self.city << ", " << self.country << ", " << self.postcode
end

def assign_chosen_role
  self.add_role(self.chosen_role) if self.roles.blank?
end
end
