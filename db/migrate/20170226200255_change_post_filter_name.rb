class ChangePostFilterName < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :filter, :color_filter
  end
end
