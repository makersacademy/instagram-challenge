class AddFbimageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fbimage, :string
  end
end
