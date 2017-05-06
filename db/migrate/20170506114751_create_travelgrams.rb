class CreateTravelgrams < ActiveRecord::Migration[5.1]
  def change
    create_table :travelgrams do |t|
      t.string :name

      t.timestamps
    end
  end
end
