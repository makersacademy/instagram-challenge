class AddUserAndPostForeignKeysToLikesTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :user, foreign_key: true
    add_reference :likes, :post, foreign_key: true
  end
end
