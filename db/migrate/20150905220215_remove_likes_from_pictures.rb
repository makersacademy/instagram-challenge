class RemoveLikesFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :likes, :string
  end
end
