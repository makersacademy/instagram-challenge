class AddUserAndPhotoToLikes < ActiveRecord::Migration[5.0]
  def change
    add_reference :likes, :user, foreign_key: true
    add_reference :likes, :photo, foreign_key: true
  end
end
