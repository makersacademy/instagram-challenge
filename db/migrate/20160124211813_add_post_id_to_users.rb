class AddPostIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :post, index: true, foreign_key: true
  end
end
