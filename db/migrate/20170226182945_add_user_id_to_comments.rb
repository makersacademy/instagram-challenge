class AddUserIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :user, index: true, foreign_key: true
  end
end
