class AddMewmentRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :mewment, foreign_key: true
  end
end
