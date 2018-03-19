class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :name_of_picture
      t.text :description_of_picture

      t.timestamps
    end
  end
end
