module UsersHelper
	def author_name(transaction)
		User.find(transaction.author_id).name
	end
end
