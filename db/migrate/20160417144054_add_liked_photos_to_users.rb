class AddLikedPhotosToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :user, index: true, foreign_key: true
  end
end
