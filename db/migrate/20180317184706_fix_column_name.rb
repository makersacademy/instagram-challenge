class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :pictures, :users_id, :user_id
  end
end
