class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :comments, :comment, :thoughts
  end
end