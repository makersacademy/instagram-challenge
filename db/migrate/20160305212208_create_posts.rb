class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :description
      t.string :image_file_name

      t.timestamps null: false
    end
  end
end
