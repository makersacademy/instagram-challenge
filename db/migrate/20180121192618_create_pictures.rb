class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
