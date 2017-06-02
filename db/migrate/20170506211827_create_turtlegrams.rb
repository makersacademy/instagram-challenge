class CreateTurtlegrams < ActiveRecord::Migration[5.1]
  def change
    create_table :turtlegrams do |t|
      t.text :caption
      t.string :image

      t.timestamps
    end
  end
end
