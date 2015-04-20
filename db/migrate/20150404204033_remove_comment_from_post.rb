class RemoveCommentFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :comment, :string
  end
end
