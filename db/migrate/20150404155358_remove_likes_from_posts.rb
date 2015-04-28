class RemoveLikesFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :likes, :integer
  end
end
