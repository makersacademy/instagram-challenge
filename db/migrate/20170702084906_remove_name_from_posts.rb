class RemoveNameFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :name, :string
  end
end
