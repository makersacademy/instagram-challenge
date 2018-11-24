class RenamePhotosToPosts < ActiveRecord::Migration[5.1]
  def change
    rename_table :photos, :posts
  end
end
