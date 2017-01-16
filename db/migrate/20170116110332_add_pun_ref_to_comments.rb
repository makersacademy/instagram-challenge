class AddPunRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :pun, foreign_key: true
  end
end
