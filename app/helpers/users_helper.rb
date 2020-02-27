module UsersHelper
	def author_name(transaction)
		User.find(transaction.author_id).name
	end

	def find_user(group)
		User.find(group.user_id)
	end
end
