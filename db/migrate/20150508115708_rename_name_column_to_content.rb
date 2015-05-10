class RenameNameColumnToContent < ActiveRecord::Migration
  # def change
  # end
  def self.up
    rename_column :posts, :name, :content
  end

  def self.down
    rename_column :post, :content, :name
  end
# end
end
