class AddGalleryRefToPictures < ActiveRecord::Migration[5.0]
  def change
    add_reference :pictures, :gallery, foreign_key: true
  end
end
