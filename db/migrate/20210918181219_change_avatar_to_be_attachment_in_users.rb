class ChangeAvatarToBeAttachmentInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :avatar, :attachment
  end
end
