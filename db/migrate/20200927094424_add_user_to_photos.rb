class AddUserToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_reference :photos, :user, null: false, foreign_key: true
  end
end
