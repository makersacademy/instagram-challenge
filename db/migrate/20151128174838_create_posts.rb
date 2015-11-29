class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :caption
      t.integer :hotornot

      t.timestamps null: false
    end
  end
end
