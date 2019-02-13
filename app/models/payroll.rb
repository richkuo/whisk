class Payroll < ApplicationRecord
  belongs_to :admin
  belongs_to :company
  has_many :transactions, inverse_of: :payroll
  # accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :transactions#, reject_if: lambda { |a| a[:amount].blank? || a[:currency_id].blank? }
end
