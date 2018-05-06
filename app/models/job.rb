class Job < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :users


def full_address
  self.street << ", " << self.city << ", " << self.country << ", " << self.postcode.to_s
end


end
