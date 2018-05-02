class User < ApplicationRecord
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
