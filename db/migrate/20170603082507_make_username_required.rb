class MakeUsernameRequired < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :username, :string, :default => '', :null => false
  end
end
