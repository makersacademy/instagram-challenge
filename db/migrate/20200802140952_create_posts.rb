class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :image
      t.string :username
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
