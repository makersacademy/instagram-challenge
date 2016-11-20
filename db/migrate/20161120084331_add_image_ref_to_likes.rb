class AddImageRefToLikes < ActiveRecord::Migration[5.0]
  def change
    add_reference :likes, :image, foreign_key: true
  end
end
