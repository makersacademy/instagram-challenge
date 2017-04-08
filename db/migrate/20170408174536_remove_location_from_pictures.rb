class RemoveLocationFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :location, :text
  end
end
