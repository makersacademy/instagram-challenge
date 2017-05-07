class AddUserRefToTurtlegrams < ActiveRecord::Migration[5.1]
  def change
    add_reference :turtlegrams, :user, foreign_key: true
  end
end
