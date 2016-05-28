class AddLocationToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :location, :string
  end
end
