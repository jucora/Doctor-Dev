class AddAmountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :amount, :decimal
  end
end
