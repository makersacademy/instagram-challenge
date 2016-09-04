class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :day
      t.integer :start_time

      t.timestamps null: false
    end
  end
end
