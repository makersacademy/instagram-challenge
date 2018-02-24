module PostsHelper

  def get_owner(id)
    User.find(id)
  end

end
