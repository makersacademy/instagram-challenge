class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, null: false, index: true, unique: true
    add_index :users, :username, unique: true
  end
end
