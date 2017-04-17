module ApplicationHelper
  def find_user_name(id_to_find)
    return User.find(id_to_find).username
  end
end
