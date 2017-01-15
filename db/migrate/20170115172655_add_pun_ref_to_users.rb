class AddPunRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :pun, foreign_key: true
  end
end
