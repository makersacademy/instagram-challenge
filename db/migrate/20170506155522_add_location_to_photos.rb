class AddLocationToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :location, :string
  end
end
