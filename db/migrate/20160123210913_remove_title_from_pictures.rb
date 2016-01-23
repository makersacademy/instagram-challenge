class RemoveTitleFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :title, :string
  end
end
