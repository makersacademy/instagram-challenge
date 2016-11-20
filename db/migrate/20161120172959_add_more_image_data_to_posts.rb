class AddMoreImageDataToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :image_name, :string
    add_column :posts, :image_content_type, :string
  end
end
