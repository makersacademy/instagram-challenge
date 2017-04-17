class RemoveUrlFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :url, :string
  end
end
