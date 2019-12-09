class RenameTextToCaption < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :text, :caption
  end
end
