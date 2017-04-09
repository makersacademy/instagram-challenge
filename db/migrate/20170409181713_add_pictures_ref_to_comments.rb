class AddPicturesRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :pictures, index: true
  end
end
