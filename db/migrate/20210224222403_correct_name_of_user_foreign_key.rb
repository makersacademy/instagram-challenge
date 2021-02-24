class CorrectNameOfUserForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :posts, :users
    add_column :posts, :user_id, :bigint
    add_foreign_key :posts, :users, column: :user_id
  end
end
