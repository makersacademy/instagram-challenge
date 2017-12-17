class AddImageToSnippets < ActiveRecord::Migration[5.1]
  def change
    add_column :insta_posts, :image, :string
  end
end
