class AddUsernameToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :username, :string
  end
end
