class AddDescriptionToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :description, :text
  end
end
