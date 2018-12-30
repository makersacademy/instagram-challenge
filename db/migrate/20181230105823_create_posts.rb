class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image
      t.text :description
      t.text :created_by

      t.timestamps
    end
  end
end
