class AddAvatarToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :avatar, :string
  end
end
