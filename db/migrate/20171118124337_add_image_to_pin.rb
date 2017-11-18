class AddImageToPin < ActiveRecord::Migration[5.1]
  def change
    add_column :pins, :image, :string
  end
end
