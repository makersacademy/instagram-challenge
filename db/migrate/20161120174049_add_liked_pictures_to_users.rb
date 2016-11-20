class AddLikedPicturesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :user, foreign_key: true
  end
end
