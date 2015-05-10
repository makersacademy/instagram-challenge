class AddPhotoIdToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :photo, index: true, foreign_key: true
  end
end
