class RenameNameColumnToTitle < ActiveRecord::Migration
  def self.up
    rename_column :posts, :name, :title
  end

  def self.down
    rename_column :posts, :title, :name
  end
end
