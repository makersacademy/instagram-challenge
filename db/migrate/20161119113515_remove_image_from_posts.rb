class RemoveImageFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :image
  end
end
