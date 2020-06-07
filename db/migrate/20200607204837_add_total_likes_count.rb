class AddTotalLikesCount < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :total_likes_count, :integer
  end
end
