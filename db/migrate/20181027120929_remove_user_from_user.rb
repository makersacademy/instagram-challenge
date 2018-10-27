class RemoveUserFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user, :string
  end
end
