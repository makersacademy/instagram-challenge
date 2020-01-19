class ReplaceForeignKeysOnCommentsTable < ActiveRecord::Migration[6.0]
  def change
    remove_reference :comments, :users
    remove_reference :comments, :posts

    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :post, foreign_key: true
  end
end
