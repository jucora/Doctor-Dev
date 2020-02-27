module TransactionsHelper
	def group_transaction(group)
		Transaction.where(group_id: group.id)
	end
end
