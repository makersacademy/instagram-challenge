class AddDefaultTitleToPictures < ActiveRecord::Migration
  def change
    change_column :pictures, :title, :string, default: "Untitled"
  end
end
