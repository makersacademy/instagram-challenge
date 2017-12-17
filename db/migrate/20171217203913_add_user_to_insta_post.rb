class AddUserToInstaPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :insta_posts, :user, foreign_key: true
  end
end
