class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :thoughts
      t.integer :rating

      t.timestamps null: false
    end
  end
end
