class AddUserIdToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_reference :photos, :user, foreign_key: true
  end
end
