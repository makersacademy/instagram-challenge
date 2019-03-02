class AddDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_pic, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
  end
end
