class AddUserIdToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :user, index: true, foreign_key: true
  end
end
