class AddUserIdToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :user, index: true
    add_foreign_key :likes, :users
  end
end
