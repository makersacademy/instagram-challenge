class AddPostIdToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :post_id, :integer
  end
end
