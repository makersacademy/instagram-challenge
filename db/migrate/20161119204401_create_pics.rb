class CreatePics < ActiveRecord::Migration[5.0]
  def change
    create_table :pics do |t|
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
