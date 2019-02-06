class Company < ApplicationRecord
  has_many :company_ownerships
  has_many :admins, through: :company_ownerships
  has_many :users
end
