class AddImageToLikes < ActiveRecord::Migration[5.1]
  def change
    add_reference :likes, :image, foreign_key: true
  end
end
