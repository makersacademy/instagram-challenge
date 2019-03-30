class AddImageUrlToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image_url, :string
  end
end
