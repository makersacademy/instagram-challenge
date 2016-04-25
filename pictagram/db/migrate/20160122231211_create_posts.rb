class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :comment

      t.timestamps null: false
    end
  end
end
