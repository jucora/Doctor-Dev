class TransactionsController < ApplicationController
	def transactions
		@transactions = Transaction.where.not(group_id: nil)
	end

	def external_transactions
		@external_transactions = Transaction.where(group_id: nil)
	end


end
