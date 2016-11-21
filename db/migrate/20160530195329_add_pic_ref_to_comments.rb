class AddPicRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :pic, index: true, foreign_key: true
  end
end
