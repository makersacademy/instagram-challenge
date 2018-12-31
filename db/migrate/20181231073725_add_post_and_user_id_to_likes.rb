class AddPostAndUserIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :post_id, :integer
    add_column :likes, :user_id, :integer
  end
end
