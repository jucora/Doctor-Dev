class TransactionsController < ApplicationController
	def index
		@transactions = Transaction.where_not(group_id: nil)
		@external_transactions = Transaction.where(group_id: nil)
	end


end
