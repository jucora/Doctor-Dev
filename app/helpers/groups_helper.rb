module GroupsHelper
  def image(group_id)
    Group.find(group_id).icon
  end
end
