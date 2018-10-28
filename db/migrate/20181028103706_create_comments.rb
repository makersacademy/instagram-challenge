# frozen_string_literal: true

# Creates the comments table
class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :gram_id
      t.datetime :posted_at

      t.timestamps
    end
  end
end
