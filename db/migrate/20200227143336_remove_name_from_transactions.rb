class RemoveNameFromTransactions < ActiveRecord::Migration[6.0]
  def change
  	remove_column :transactions, :name
  end
end
