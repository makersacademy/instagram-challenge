class AddUserNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_name, :string
    add_index :users, :user_name, unique: true
  end
end
