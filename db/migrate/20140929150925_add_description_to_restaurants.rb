class AddDescriptionToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :description, :string
  end
end
