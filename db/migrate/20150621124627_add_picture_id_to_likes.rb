class AddPictureIdToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :picture_id, :integer
  end
end
