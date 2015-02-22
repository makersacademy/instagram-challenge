class RemoveCommentsFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :comments, :text
  end
end
