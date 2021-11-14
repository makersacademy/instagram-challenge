class AddingColumnsToPostsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :image_data, :string
    add_column :posts, :caption, :string
    add_reference :posts, :user, index: true 
  end
end
