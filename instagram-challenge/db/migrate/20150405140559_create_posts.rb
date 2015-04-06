class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.attachment :image
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
