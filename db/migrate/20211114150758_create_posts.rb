class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :likes
      t.text :liked_by
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
