class AddColumnToComments < ActiveRecord::Migration
  def change
    add_column :comments, :comment, :text
  end
end
