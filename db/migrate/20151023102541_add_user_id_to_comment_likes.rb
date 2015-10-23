class AddUserIdToCommentLikes < ActiveRecord::Migration
  def change
    add_reference :comment_likes, :user, index: true, foreign_key: true
  end
end
