class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :name
      t.string :photo_file
      t.string :string

      t.timestamps
    end
  end
end
