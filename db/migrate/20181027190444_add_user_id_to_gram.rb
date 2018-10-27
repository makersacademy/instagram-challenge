# frozen_string_literal: true

# Adds a user_id column to the grams table
class AddUserIdToGram < ActiveRecord::Migration[5.2]
  def change
    add_column :grams, :user_id, :integer
  end
end
