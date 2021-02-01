class RemovePictureFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :picture, :string
  end
end
