class AddUserToArticles < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :user, index: true, foreign_key: true
  end
end
