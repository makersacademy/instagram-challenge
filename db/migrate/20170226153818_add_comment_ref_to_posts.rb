class AddCommentRefToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :comment, foreign_key: true
  end
end
