class RemoveCommentFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :comment, :text
  end
end
