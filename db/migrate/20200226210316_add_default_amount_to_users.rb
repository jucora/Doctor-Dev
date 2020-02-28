class AddDefaultAmountToUsers < ActiveRecord::Migration[6.0]
  def change
  	change_column :users, :amount, :decimal, default: 50
  end
end
