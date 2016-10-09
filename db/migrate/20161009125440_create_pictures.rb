class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :title
      t.integer :likes, default: 0
      t.timestamps
    end
  end
end
