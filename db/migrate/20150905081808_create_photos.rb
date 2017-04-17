class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :description
      t.string :picture

      t.timestamps null: false
    end
  end
end
