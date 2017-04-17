class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.integer :rating

      t.timestamps null: false
    end
  end
end
