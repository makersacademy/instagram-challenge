class AddDescriptionToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :description, :string
  end
end
