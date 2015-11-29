class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :tag

      t.timestamps null: false
    end
  end
end
