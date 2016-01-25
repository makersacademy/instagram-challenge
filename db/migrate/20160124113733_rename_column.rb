class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :users, :username, :user_name
  end
end
