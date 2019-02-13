class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :payroll_id

      t.integer :company_id, null: false
      t.string :company_name, null: false
      t.string :from_address, null: false

      t.integer :user_id, null: false
      t.string :user_email, null: false
      t.string :to_address, null: false

      t.integer :currency_id, null: false
      t.string :amount, null: false

      t.string :notes

      t.datetime :settled_at

      t.timestamps
    end
  end
end
