class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :tag
      t.integer :likes

      t.timestamps null: false
    end
  end
end
