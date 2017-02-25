class AddUserRefToInstapics < ActiveRecord::Migration[5.0]
  def change
    add_reference :instapics, :user, foreign_key: true
  end
end
