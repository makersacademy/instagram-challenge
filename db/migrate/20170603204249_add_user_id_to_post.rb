class AddUserIdToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user, foreign_key: true
  end
end
