class AddPaperclipFields < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :image_file_name,    :string
    add_column :photos, :image_content_type, :string
    add_column :photos, :image_file_size,    :integer
    add_column :photos, :image_updated_at,   :datetime
  end
end
