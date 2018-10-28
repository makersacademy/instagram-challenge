class AddLikesToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :likers_count, :integer, :default => 0
  end
end
