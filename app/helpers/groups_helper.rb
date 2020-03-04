module GroupsHelper
  def find_group(group_id)
    Group.find(group_id)
  end

  # def other_group
  #   Group.where.not(user_id: current_user.id)
  # end
end
