class AddCommentToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :comment, index: true, foreign_key: true
  end
end
