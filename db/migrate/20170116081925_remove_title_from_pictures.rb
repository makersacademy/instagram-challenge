class RemoveTitleFromPictures < ActiveRecord::Migration[5.0]
  def change
    remove_column :pictures, :title, :string
  end
end
