module PostsHelper

  def get_user_by_id(id)
    User.find(id)
  end

  def get_username_by_id(id)
    User.find(id).email.split("@")[0]
  end

  def current_user_has_liked_post(post)
    !!post.likes.find_by(user_id: current_user.id)
  end

  def get_like(post)
    post.likes.find_by(user_id: current_user.id)
  end

  def person_count(count)
    return "#{count} person likes" if count == 1
    "#{count} people like" 
  end

end
