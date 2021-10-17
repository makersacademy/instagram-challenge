module UsersHelper
  def friends?(user1, user2)
    Friendship.exists?(user_id: user1, friend_id: user2) ||
    Friendship.exists?(user_id: user2, friend_id: user1)
  end
end
