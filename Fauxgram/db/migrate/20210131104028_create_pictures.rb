class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :img_link
      t.integer :likes
      t.boolean :liked
      t.string :created_by

      t.timestamps
    end
  end
end
