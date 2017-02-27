module ArticlesHelper
  def creator_email(content)
    User.find(content.user_id).email
  end

  def owner?(content)
    user_signed_in? ? content.user_id == current_user.id : false
  end
end
