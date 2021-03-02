class AddUsernametoComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :username, :string
  end
end
