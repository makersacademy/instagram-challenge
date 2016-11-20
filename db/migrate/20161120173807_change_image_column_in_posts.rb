class ChangeImageColumnInPosts < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :image, :image_data
  end
end
