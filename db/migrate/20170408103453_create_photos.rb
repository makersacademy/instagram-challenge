class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :location

      t.timestamps null: false
    end
  end
end
