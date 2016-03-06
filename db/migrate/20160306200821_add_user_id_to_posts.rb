class AddUserIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :user, index: true, foreign_key: true
    add_index :posts, [:user_id, :created_at]
  end
end
