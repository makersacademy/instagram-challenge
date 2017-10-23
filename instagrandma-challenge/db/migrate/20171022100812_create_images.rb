class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :title
      t.text :location
      t.text :likes
      t.timestamps
    end
  end


end
