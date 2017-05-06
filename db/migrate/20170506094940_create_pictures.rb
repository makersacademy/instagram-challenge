class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :url
      t.integer :likes

      t.timestamps
    end
  end
end
