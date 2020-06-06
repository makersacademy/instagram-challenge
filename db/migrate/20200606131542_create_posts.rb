class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :image
      t.boolean :active
      t.reference :account
      t.timestamps
    end
  end
end
