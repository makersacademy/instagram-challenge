class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :picture

      t.timestamps null: false
    end
  end
end
