class ChangeCityColumnName < ActiveRecord::Migration
  def change
    rename_column :pictures, :city, :address
  end
end
