class AddUserIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :user_id, :integer
  end
end
