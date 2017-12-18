class AddImagetagToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :image_url, :string
  end
end
