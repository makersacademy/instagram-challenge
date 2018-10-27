# frozen_string_literal: true

# Creates the user table
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    end
  end
end
