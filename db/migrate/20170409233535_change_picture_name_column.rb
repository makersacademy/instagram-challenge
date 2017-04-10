class ChangePictureNameColumn < ActiveRecord::Migration
  def change
    rename_column :pictures, :name, :description
  end
end
