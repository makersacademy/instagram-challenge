class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.datetime :postDateTime
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
