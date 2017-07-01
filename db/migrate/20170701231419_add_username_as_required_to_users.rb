class AddUsernameAsRequiredToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :username, :string, null: false, index: true, unique: true
  end
end
