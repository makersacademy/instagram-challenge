class AddPrimaryKeyToLikesTable < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, [:post_id, :user_id], unique: true
  end
end
