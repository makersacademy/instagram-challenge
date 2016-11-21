class CreateUserthoughts < ActiveRecord::Migration[5.0]
  def change
    create_table :userthoughts do |t|
      t.text :thoughts
      t.integer :rating

      t.timestamps
    end
  end
end
