class AddCaptionColumnToPost < ActiveRecord::Migration
  def change
    add_column :posts, :caption, :text
  end
end
