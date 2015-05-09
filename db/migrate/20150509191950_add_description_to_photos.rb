class AddDescriptionToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :description, :string
  end
end
