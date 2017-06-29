class AddPhotoIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :photo, index: true, foreign_key: true
  end
end
