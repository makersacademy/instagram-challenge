class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :active_storage_blobs, :users_id
  end
end
