class Job < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :users
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{street}, #{city}, #{country}, #{postcode}"
  end
end
