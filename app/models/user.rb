class User < ApplicationRecord
  # has_many :accounts, as: :accountable
  include Accountable

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :employments
  has_many :companies, through: :employments
  has_many :transactions

  def active_accounts
    # each account has multiple
  end

  def account
    accounts.last
  end

  def name
    first_name + ' ' + last_name
  end
end
