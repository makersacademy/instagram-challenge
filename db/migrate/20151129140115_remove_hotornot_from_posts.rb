class RemoveHotornotFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :hotornot, :integer
  end
end
