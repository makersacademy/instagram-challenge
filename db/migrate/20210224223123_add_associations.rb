class AddAssociations < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :posts, :users
    add_reference :posts, :user, column: :user_id, foreign_key: true
  end
end
