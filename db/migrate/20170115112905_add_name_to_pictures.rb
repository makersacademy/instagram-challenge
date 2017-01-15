class AddNameToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :name, :string
  end
end
