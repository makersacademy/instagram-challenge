class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.integer :rating

      t.timestamps null: false
    end
  end
end
