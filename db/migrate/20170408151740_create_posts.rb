class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.attachment :image
      t.text :caption

      t.timestamps null: false
    end
  end
end
