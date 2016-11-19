class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :pictures, :description, :caption
  end
end
