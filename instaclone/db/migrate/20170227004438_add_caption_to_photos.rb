class AddCaptionToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :caption, :string
  end
end
