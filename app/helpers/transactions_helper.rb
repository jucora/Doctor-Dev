module TransactionsHelper
  # def group_transaction(group)
  #   Transaction.where(group_id: group.id)
  # end

  def transaction_title(type)
  	if type == 'group_transaction'
  		'All my transactions'
  	else
  		'All my external transactions'
  	end
  end
end
