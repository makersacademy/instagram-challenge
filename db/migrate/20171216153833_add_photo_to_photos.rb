class AddPhotoToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :photo, :string
  end
end
