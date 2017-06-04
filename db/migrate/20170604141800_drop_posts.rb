class DropPosts < ActiveRecord::Migration[5.1]
  def change
    drop_table :posts
  end
end
