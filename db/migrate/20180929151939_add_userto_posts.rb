class AddUsertoPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :user, index: true, foreign_key: true
  end
end
