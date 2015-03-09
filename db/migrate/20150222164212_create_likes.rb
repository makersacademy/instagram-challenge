class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :likes, :posts
  end
end
