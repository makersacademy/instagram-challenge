class AddImageToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :image, :string
  end
end
