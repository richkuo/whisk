class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string   :address
      t.string   :address_secondary
      t.text     :notes
      t.integer  :currency_id

      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      # t.integer :accountable_id
      # t.string  :accountable_type
      t.references :accountable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
