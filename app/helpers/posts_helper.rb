module PostsHelper

  def get_user_by_id(id)
    User.find(id)
  end

  def get_username_by_id(id)
    User.find(id).email.split("@")[0]
  end

end
