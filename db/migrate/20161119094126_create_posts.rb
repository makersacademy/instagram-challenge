class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :caption
      t.integer :comments_count, default: 0
      t.integer :likes_count, default: 0
      t.integer :dislikes_count, default: 0
      t.references :user

      t.timestamps
    end
  end
end
