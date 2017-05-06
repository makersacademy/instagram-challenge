class AddDescriptionToTravelgrams < ActiveRecord::Migration[5.1]
  def change
    add_column :travelgrams, :description, :text
  end
end
