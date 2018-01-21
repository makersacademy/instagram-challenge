class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.text :description
      t.integer :likes

      t.timestamps
    end
  end
end