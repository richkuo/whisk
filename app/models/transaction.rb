class Transaction < ApplicationRecord
  belongs_to :company
  belongs_to :user
  belongs_to :payroll, inverse_of: :transactions
  # has_one :currency

  # t.integer :company_id, null: false
  # t.string :company_name, null: false
  # t.string :from_address, null: false

  # t.integer :user_id, null: false
  # t.string :user_email, null: false
  # t.string :to_address, null: false

  # t.integer :currency_id, null: false
  # t.string :amount, null: false
  # t.string :notes

  # t.datetime settled_at
end
