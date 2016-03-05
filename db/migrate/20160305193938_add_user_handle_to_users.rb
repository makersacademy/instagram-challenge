class AddUserHandleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_handle, :string
  end
end
