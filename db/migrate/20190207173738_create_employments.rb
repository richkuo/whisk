class CreateEmployments < ActiveRecord::Migration[5.2]
  def change
    create_table :employments do |t|
      t.integer :company_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index(:employments, [:company_id, :user_id], unique: true)
  end
end
