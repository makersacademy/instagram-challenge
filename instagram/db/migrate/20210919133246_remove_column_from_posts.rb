class RemoveColumnFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :active_storage_blobs_id
  end
end
