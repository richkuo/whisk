class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :lockable

  has_many :company_ownerships
  has_many :companies, through: :company_ownerships
end
