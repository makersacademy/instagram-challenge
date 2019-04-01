class RemoveUsernameFromHams < ActiveRecord::Migration[5.2]
  def change
    remove_column :hams, :username
  end
end
