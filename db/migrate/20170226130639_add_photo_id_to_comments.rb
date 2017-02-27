class AddPhotoIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :photo, index: true, foreign_key: true
  end
end
