class AddPictureIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :picture, index: true, foreign_key: true
  end
end
