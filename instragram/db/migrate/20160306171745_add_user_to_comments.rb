class AddUserToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user, :string
  end
end
