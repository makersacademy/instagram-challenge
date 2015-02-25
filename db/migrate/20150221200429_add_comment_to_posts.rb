class AddCommentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :comment, :text
  end
end
