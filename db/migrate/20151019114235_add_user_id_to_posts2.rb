class AddUserIdToPosts2 < ActiveRecord::Migration
  def change
    remove_reference :posts, :post, index: true, foreign_key: true
    add_reference :posts, :user, index: true, foreign_key: true
  end
end
