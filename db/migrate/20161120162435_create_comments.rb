class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :words
      t.references :picture, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
