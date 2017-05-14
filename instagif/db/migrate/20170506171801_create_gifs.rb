class CreateGifs < ActiveRecord::Migration[5.1]
  def change
    create_table :gifs do |t|
      t.string :url
      t.string :generator

      t.timestamps
    end
  end
end
