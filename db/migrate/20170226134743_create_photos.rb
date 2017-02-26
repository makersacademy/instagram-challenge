class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :description

      t.timestamps
    end
  end
end
