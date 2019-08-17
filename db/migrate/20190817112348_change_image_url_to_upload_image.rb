class ChangeImageUrlToUploadImage < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :image, :image
    remove_column :photos, :link
  end
end
