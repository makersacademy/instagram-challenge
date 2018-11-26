# frozen_string_literal: true

class AddUserIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :user_id, :integer
    add_foreign_key :posts, :users
  end
end
