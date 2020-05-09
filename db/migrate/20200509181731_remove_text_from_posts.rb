class RemoveTextFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :text, :text
  end
end
