class ChangePostsToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :posts, :users
  end
end
