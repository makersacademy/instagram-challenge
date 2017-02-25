class AddPostRefToLikes < ActiveRecord::Migration[5.0]
  def change
    add_reference :likes, :post, foreign_key: true
  end
end
