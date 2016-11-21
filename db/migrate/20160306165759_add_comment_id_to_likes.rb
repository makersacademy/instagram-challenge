class AddCommentIdToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :comment, index: true, foreign_key: true
  end
end
