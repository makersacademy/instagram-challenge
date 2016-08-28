class RemoveAvatarFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :avatar, :string
  end
end
