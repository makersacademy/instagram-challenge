class RenameMessageToCaption < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :message, :caption
  end
end
