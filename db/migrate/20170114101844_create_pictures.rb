class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :caption
      t.string :location

      t.timestamps
    end
  end
end
