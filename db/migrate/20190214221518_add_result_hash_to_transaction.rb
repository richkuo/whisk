class AddResultHashToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :actual_from_address, :string
    add_column :transactions, :result_hash, :string
  end
end
