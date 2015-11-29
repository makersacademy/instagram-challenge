module ApplicationHelper
  def find_user_email(id)
    @user = User.find_by(id: id)
    return @user.email
  end
end
