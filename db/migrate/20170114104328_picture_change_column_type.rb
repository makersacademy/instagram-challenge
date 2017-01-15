class PictureChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column(:pictures, :caption, :string)
  end
end
