class RemoveResourceIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :resource_id, :integer
  end
end
