class Job < ApplicationRecord
  belongs_to :user
  has_many :jobs_userss
  has_many :users, through: :jobs_users
end
