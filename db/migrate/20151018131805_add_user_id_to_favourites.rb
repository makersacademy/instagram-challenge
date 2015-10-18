class AddUserIdToFavourites < ActiveRecord::Migration
  def change
    add_reference :favourites, :user, index: true, foreign_key: true
  end
end
