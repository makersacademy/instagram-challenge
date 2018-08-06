class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :attachment, :image
  end
end
