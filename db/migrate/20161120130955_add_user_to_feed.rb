class AddUserToFeed < ActiveRecord::Migration[5.0]
  def change
    add_reference :feeds, :user, foreign_key: true
  end
end
