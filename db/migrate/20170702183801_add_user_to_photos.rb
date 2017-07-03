class AddUserToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :user_id, :integer
  end
end
