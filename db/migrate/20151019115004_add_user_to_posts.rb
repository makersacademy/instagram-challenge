class AddUserToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :user, index: true
    add_foreign_key :uploads, :users
  end
end
