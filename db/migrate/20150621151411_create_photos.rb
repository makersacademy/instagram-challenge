class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :user
      t.integer :likes

      t.timestamps null: false
    end
  end
end
