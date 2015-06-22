class AddTitleToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :title, :string
  end
end
