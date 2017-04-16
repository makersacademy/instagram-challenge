class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.integer :likes

      t.timestamps null: false
    end
  end
end
