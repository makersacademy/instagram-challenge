class AddPhotoRefToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :photo, foreign_key: true
  end
end
