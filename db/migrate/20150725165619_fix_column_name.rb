class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :pictures, :caption, :title
  end
end
