class CreateCompanyOwnerships < ActiveRecord::Migration[5.2]
  def change
    create_table :company_ownerships do |t|
      t.integer :admin_id, null: false
      t.integer :company_id, null: false

      t.timestamps
    end

    add_index(:company_ownerships, [:admin_id, :company_id], unique: true)
  end
end
