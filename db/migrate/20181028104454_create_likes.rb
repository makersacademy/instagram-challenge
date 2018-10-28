# frozen_string_literal: true

# Creates the likes table
class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :gram_id

      t.timestamps
    end
  end
end
