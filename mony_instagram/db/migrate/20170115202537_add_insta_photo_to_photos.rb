class AddInstaPhotoToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :insta_photo, :string
  end
end
