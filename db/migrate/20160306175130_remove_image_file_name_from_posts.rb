class RemoveImageFileNameFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :image_file_name, :string
  end
end
