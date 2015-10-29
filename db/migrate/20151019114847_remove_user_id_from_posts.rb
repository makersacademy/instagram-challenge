class RemoveUserIdFromPosts < ActiveRecord::Migration
  def change
    remove_reference :posts, :user, index: true, foreign_key: true
  end
end
