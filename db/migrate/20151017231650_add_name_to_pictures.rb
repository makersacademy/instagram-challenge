class AddNameToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :name, :text
  end
end
