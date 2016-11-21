class AddCaptionToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :caption, :string
  end
end
