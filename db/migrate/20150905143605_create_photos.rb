class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.integer :like

      t.timestamps null: false
    end
  end
end
