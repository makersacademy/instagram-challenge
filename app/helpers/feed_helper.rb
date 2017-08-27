module FeedHelper
  def following_photos(user)
    User.followed_users(user).map { |u| u.photos }.flatten
  end
end
