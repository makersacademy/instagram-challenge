class AddAvatarToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :avatar, :string
  end
end
