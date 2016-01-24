class AddUserIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :text
  end
end
