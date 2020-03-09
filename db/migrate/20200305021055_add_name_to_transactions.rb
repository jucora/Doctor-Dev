class AddNameToTransactions < ActiveRecord::Migration[6.0]
  def change
  	add_column :transactions, :name, :string
  end
end
