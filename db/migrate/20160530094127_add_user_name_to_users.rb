class AddUserNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string, unique: true
  end
end
