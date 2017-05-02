class AddUserToPicture < ActiveRecord::Migration
  def change
    add_reference :pictures, :user, index: true, foreign_key: true
  end
end
