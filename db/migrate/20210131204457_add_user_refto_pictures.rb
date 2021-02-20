class AddUserReftoPictures < ActiveRecord::Migration[6.1]
  def change
    add_reference :pictures, :user, foreign_key: true
  end
end
