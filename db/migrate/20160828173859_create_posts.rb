class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.binary :image

      t.timestamps null: false
    end
  end
end
