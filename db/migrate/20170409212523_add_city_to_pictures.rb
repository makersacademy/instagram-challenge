class AddCityToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :city, :string
  end
end
