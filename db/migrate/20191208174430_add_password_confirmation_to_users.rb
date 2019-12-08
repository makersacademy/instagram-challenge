class AddPasswordConfirmationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_confirmation, :string
  end
end
