class AddPhotoIdToPhotoLikes < ActiveRecord::Migration
  def change
    add_reference :photo_likes, :photo, index: true, foreign_key: true
  end
end
