class UpdateUserTable < ActiveRecord::Migration[5.2]
  def change
      rename_column :users, :name, :username
  end
end
