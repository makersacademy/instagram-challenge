class AddUserToPin < ActiveRecord::Migration[5.1]
  def change
    add_reference :pins, :user, foreign_key: true
  end
end
