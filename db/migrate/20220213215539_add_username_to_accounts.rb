class AddUsernameToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :username, :string, limit: 20
    add_column :accounts, :firstname, :string, limit: 20
    add_column :accounts, :lastname , :string, limit: 20
  end
end
