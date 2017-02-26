class AddPhotoRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :photo, foreign_key: true
  end
end
