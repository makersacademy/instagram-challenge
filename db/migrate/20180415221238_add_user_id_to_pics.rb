class AddUserIdToPics < ActiveRecord::Migration[5.1]
  def change
    add_column :pics, :user_id, :integer
  end
end
