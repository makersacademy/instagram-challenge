class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
      t.binary :picture

      t.timestamps null: false
    end
  end
end
