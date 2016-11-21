class AddPhotoRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :Photo, index: true, foreign_key: true
  end
end
