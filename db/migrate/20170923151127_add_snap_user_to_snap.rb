class AddSnapUserToSnap < ActiveRecord::Migration[5.1]
  def change
    add_column :snaps, :snap_user, :string
  end
end
