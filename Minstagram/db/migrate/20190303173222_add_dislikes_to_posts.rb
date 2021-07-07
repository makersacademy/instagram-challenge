class AddDislikesToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :dislikes, :text
  end
end
