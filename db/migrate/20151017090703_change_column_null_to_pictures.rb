class ChangeColumnNullToPictures < ActiveRecord::Migration
  def change
    change_column_null :pictures, :picture_file_name, false
  end
end
