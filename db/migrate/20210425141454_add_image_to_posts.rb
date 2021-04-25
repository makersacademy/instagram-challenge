class AddImageToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :image, :string
  end
end
