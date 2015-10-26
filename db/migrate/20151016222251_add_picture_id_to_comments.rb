class AddPictureIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :picture_id, :integer
  end
end
