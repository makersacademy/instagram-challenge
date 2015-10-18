class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :description
      t.string :comment

      t.timestamps null: false
    end
  end
end
