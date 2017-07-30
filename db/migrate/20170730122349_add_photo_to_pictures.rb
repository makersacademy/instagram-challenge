class AddPhotoToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :photo, :string
  end
end
