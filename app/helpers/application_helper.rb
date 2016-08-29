module ApplicationHelper

  def feed_path(user)
    "/#{user.username}"
  end

end
