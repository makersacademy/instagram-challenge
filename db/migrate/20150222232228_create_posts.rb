class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name

      t.timestamps
    end
  end
end
