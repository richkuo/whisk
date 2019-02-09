class Account < ApplicationRecord
  belongs_to :accountable, polymorphic: true

  # t.string   :address
  # t.string   :address_secondary
  # t.text     :notes
  # t.integer  :currency_id

  def confirmed?
    !!confirmed_at
  end

  def type
    accountable_type
  end

  def user?
    accountable_type == 'User'
  end

  def admin?
    accountable_type == 'Admin'
  end
end
