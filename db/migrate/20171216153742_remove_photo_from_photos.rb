class RemovePhotoFromPhotos < ActiveRecord::Migration[5.1]
  def change
    remove_column :photos, :photo, :text
  end
end
