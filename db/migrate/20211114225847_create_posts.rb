class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :image_data
      t.string :caption

      t.timestamps
    end
  end
end
