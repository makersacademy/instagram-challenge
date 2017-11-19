class CreateFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :followers do |t|
      t.references :user, foreign_key: true
      t.integer :followee

      t.timestamps
    end
  end
end
