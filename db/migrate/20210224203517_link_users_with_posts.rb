class LinkUsersWithPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :users, foreign_key: true
  end
end
