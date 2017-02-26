module ArticlesHelper
  def creator_email(content)
    User.find(content.user_id).email
  end
end
