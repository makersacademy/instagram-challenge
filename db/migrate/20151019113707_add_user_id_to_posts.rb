class AddUserIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :post, index: true, foreign_key: true
  end
end
