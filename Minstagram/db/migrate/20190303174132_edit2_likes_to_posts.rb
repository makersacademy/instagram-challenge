class Edit2LikesToPosts < ActiveRecord::Migration[5.1]
  def change
    change_column_default :posts, :likes, nil
  end
end
