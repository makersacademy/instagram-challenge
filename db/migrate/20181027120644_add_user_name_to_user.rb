class AddUserNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user, :string
    add_column :users, :username, :string
  end
end
