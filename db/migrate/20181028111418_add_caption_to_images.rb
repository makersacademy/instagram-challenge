class AddCaptionToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :caption, :string
  end
end
