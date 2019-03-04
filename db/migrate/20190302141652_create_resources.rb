# frozen_string_literal: true

class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.references :post, foreign_key: true, null: false
      t.string :location, null: false

      t.timestamps
    end
  end
end
