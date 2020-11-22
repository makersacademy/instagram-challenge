class AddColumnsToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :full_name, :varchar
    add_column :accounts, :username, :varchar
  end
end
