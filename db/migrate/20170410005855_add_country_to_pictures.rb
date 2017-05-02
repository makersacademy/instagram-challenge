class AddCountryToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :country, :string
  end
end
