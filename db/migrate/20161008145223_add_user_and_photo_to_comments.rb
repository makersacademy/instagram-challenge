class AddUserAndPhotoToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :photo, foreign_key: true
  end
end
