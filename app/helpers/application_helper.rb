module ApplicationHelper
  def user_handle(user = current_user)
    user.email.split('@').first
  end
end
