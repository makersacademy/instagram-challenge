class AddTagToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :tag, :text
  end
end
