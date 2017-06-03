class AddTitleToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :title, :string
  end
end
