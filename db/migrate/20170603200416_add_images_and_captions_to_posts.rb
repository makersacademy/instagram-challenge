class AddImagesAndCaptionsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :image, :string
    add_column :posts, :caption, :string
  end
end
