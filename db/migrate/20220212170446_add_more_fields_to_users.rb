class AddMoreFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :usernname, :string
    add_column :users, :name, :string
    add_column :users, :bio, :text
  end
end
