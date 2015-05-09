class AddUserToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :user, index: true, foreign_key: true
  end
end
