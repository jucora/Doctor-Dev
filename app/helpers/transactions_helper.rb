module TransactionsHelper
  def transaction_title(type)
    if type == 'group_transaction'
      'All my transactions'
    else
      'All my external transactions'
    end
  end
end
