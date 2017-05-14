class AddPostRefToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :post, foreign_key: true
  end
end
