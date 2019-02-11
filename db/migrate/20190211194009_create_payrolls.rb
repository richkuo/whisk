class CreatePayrolls < ActiveRecord::Migration[5.2]
  def change
    create_table :payrolls do |t|
      t.integer :admin_id, null: false
      t.integer :company_id, null: false
      t.string :batch_number
      t.string :pay_period
      t.text :notes

      t.timestamps
    end
  end
end
