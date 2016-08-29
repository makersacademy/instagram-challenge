class AddCaptionsToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :caption, :text
  end
end
