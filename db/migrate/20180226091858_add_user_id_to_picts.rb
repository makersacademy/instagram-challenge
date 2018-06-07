class AddUserIdToPicts < ActiveRecord::Migration[5.1]
  def change
    add_reference :picts, :user, foreign_key: true
  end
end
