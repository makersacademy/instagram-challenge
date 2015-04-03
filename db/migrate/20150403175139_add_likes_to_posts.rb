class AddLikesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :likes, :integer
  end
end
