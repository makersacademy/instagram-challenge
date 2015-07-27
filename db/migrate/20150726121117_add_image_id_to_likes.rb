class AddImageIdToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :image, index: true, foreign_key: true
  end
end
