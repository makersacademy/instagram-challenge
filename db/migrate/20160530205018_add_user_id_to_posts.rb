class AddUserIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :user, index: true
  end
end
