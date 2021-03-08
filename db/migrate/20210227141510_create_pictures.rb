class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :caption
      t.integer :likes
      t.string :comments

      t.timestamps
    end
  end
end
