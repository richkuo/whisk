class User < ApplicationRecord
  # has_many :accounts, as: :accountable
  include Accountable

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :employments
  has_many :companies, through: :employments

  def active_accounts
    # each account has multiple
  end

  def account
    accounts.last
  end
end
