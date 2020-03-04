module GroupsHelper
  def find_group(group_id)
    Group.find(group_id)
  end
end
