class AddUserToPictures < ActiveRecord::Migration[5.0]
  def change
    add_reference :pictures, :user, foreign_key: true
  end
end
