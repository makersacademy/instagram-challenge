class AddPicturesToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :pictures, :text
  end
end
