class Company < ApplicationRecord
  # has_many :accounts, as: :accountable
  include Accountable

  has_many :company_ownerships
  has_many :admins, through: :company_ownerships

  has_many :employments
  has_many :users, through: :employments
  # TODO change has_many users to has_many :employees, through: :employments, source: :user

  has_many :payrolls

  def account
    accounts.last
  end
end
