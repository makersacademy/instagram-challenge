class AddPictureIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :picture, index: true
    add_foreign_key :comments, :pictures
  end
end
