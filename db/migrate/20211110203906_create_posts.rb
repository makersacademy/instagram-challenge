class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :message
      t.integer :like_count

      t.timestamps
    end
  end
end
