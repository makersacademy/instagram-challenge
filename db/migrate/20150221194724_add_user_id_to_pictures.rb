class AddUserIdToPictures < ActiveRecord::Migration
  def change
    add_reference :pictures, :user, index: true
    add_foreign_key :pictures, :users
  end
end
