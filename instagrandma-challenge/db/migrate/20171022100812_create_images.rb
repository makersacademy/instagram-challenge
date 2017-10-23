class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :title
      t.text :location
      t.integer :likes, :default => 0
      t.timestamps
    end
  end


end
