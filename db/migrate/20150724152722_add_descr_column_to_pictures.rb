class AddDescrColumnToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :descr, :string
  end
end
