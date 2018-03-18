class RemovePictureurlFromPictures < ActiveRecord::Migration[5.1]
  def change
    remove_column :pictures, :picture_url
  end
end
