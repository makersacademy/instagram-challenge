class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :comment, :content
  end
end
