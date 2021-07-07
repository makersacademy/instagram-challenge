class EditLikesToPosts < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :likes, :text
  end
end
