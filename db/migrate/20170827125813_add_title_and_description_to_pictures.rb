class AddTitleAndDescriptionToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :title, :string
    add_column :pictures, :description, :text
  end
end
