class AddImageToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :image, :string
  end
end
