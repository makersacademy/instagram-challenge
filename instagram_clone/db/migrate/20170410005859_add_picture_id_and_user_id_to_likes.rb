class AddPictureIdAndUserIdToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :picture, index: true, foreign_key: true
    add_reference :likes, :user, index: true, foreign_key: true
  end
end
