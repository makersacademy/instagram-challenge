class AddUsersRefToPics < ActiveRecord::Migration[5.2]
  def change
    add_reference :pics, :user, foreign_key: true
  end
end
