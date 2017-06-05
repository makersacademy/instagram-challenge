class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    change_column_null :users, :username, false
    add_index :users, :username
  end
end
