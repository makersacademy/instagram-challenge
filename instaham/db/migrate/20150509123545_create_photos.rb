class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :message

      t.timestamps null: false
    end
  end
end
