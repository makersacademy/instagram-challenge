class AddUserToReactions < ActiveRecord::Migration[5.0]
  def change
    add_reference :reactions, :user, foreign_key: true
  end
end
