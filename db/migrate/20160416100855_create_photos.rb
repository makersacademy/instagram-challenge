class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :status

      t.timestamps null: false
    end
  end
end
