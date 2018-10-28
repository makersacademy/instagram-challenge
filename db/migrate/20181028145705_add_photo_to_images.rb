class AddPhotoToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :photo, :string
  end
end
