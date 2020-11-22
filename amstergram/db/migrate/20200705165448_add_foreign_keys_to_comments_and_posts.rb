class AddForeignKeysToCommentsAndPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :post, foreign_key: { to_table: :posts }, on_delete: :cascade
    add_reference :comments, :user, foreign_key: { to_table: :users }
    add_reference :posts, :user, foreign_key: { to_table: :users }
  end
end
