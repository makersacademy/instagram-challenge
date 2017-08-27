class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :imagepath
      t.string :caption
      t.timestamps
    end
  end
end
