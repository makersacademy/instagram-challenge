class AddPostIdToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :post, index: true, foreign_key: true
  end
end
