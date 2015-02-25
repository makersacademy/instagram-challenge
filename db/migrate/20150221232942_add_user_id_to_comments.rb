class AddUserIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :user, index: true
    add_foreign_key :comments, :users
  end
end
