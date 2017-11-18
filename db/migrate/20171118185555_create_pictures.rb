class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
