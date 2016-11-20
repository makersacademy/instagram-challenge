class RemoveTimestampsFromLikes < ActiveRecord::Migration[5.0]
  def change
    remove_column :likes, :created_at, :string
    remove_column :likes, :updated_at, :string
  end
end
