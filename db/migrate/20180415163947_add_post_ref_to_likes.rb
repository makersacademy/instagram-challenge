class AddPostRefToLikes < ActiveRecord::Migration[5.2]
  def change
    add_reference :likes, :post, foreign_key: true
  end
end
