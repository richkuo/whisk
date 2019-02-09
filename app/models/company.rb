class Company < ApplicationRecord
  has_many :company_ownerships
  has_many :admins, through: :company_ownerships

  has_many :employments
  has_many :users, through: :employments
  # TODO change has_many users to has_many :employees, through: :employments, source: :user
end
