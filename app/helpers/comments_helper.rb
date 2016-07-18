module CommentsHelper

  def user(comment_user_id)
    username(User.find(comment_user_id.to_i).email)
  end

end
