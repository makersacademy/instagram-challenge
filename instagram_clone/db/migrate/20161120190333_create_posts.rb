class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :rating

      t.timestamps null: false
    end
  end
end
