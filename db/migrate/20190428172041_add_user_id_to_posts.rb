class AddUserIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :users, index: true, foreign_key: true
  end
end
