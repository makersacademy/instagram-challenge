class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.text :link
      t.text :caption

      t.timestamps
    end
  end
end
