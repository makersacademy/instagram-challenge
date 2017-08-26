class AddPostToLikes < ActiveRecord::Migration[5.1]
  def change
    add_reference :likes, :post, foreign_key: true
  end
end
