module FollowersHelper
  def current_user_following(user)
    user.followers.where(id: current_user.id).first
  end

  def followings(user)
    User.joins(:followers).select('follower_id').group('follower_id').count[user.id] || 0
  end
end
