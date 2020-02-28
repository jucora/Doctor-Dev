class RemoveTransactionIdFromGroups < ActiveRecord::Migration[6.0]
  def change
  	remove_column :groups, :transaction_id, :bigint
  end
end
