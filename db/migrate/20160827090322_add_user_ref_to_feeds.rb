class AddUserRefToFeeds < ActiveRecord::Migration
  def change
    add_reference :feeds, :user, index: true, foreign_key: true
  end
end
