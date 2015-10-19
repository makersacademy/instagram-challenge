class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.belongs_to :comment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
