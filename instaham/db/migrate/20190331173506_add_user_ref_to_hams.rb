class AddUserRefToHams < ActiveRecord::Migration[5.2]
  def change
    add_reference :hams, :user, foreign_key: true
  end
end
