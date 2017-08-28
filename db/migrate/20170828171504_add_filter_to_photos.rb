class AddFilterToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :filter, :string
  end
end
