class AddCommentIdToCommentLikes < ActiveRecord::Migration
  def change
    add_reference :comment_likes, :comment, index: true, foreign_key: true
  end
end
