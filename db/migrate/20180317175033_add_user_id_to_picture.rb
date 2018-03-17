class AddUserIdToPicture < ActiveRecord::Migration[5.1]
  def change
    add_reference :pictures, :users, index: true, foreign_key: true
  end
end
