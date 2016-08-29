class AddUserRefsToFollowings < ActiveRecord::Migration
  def change
    add_column :followings, :followed_id, :integer
    add_column :followings, :follower_id, :integer
  end
end
