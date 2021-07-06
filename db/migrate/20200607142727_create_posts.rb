class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :message
      t.string :picture

      t.timestamps
    end
  end
end
