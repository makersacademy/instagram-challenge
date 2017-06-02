class AddTurtlegramRefToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :turtlegram, foreign_key: true
  end
end
