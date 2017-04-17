class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
