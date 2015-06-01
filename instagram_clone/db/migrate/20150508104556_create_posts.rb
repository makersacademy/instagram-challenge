class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :time

      t.timestamps null: false
    end
  end
end
