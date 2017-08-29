class RemoveColumnFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :imagepath
  end
end
