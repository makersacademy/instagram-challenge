class RenmeUserNameToUsername < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :user_name, :username
  end
end
