class AddUserNameToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :user_name, unique: true
  end
end
