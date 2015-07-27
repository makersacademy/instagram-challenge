class AddPictureIdToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :picture, index: true, foreign_key: true
  end
end
