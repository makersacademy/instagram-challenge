class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :pictures, :description, :title
  end
end
