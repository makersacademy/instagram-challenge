class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :filepath
      t.text :description

      t.timestamps
    end
  end
end
