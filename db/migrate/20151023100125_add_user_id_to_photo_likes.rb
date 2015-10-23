class AddUserIdToPhotoLikes < ActiveRecord::Migration
  def change
    add_reference :photo_likes, :user, index: true, foreign_key: true
  end
end
