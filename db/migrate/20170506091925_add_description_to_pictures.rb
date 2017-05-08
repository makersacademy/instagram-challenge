class AddDescriptionToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :description, :text
  end
end
