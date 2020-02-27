class ChangeAmountToBeDecimalInTransactions < ActiveRecord::Migration[6.0]
  def change
  	change_column :transactions, :amount, :decimal
  end
end
