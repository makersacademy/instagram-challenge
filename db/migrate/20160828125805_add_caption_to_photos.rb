class AddCaptionToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :caption, :text
  end
end
