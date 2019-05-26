class AddUserNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_name, :string
  end
end
