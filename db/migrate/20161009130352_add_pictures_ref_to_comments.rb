class AddPicturesRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :pictures, foreign_key: true
  end
end
