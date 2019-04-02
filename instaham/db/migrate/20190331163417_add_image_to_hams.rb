class AddImageToHams < ActiveRecord::Migration[5.2]
  def change
    add_column :hams, :image, :string
  end
end
