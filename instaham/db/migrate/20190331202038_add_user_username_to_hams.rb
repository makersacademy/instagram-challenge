class AddUserUsernameToHams < ActiveRecord::Migration[5.2]
  def change
    add_column :hams, :username, :string
  end
end
