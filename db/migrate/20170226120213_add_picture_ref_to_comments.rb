class AddPictureRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :picture, foreign_key: true
  end
end
