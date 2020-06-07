class Make0 < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:posts, :total_likes_count, 0)
  end
end
