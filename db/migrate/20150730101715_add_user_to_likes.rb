class AddUserToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :user, index: true, foreign_key: true
  end
end
