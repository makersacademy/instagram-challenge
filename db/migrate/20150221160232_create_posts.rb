class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.datetime :posted

      t.timestamps null: false
    end
  end
end
