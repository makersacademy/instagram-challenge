class AddUserIdToListing < ActiveRecord::Migration
  def change
    add_reference :listings, :user, index: true, foreign_key: true
  end
end
