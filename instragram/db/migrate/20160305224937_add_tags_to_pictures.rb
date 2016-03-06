class AddTagsToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :tags, :text
  end
end
