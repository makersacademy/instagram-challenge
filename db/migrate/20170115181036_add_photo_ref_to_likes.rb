class AddPhotoRefToLikes < ActiveRecord::Migration[5.0]
  def change
    add_reference :likes, :photo, foreign_key: true
  end
end
