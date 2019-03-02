class AddCommentToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :comment, :text
  end
end
