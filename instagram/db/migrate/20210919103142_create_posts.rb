class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :users, null: false, foreign_key: true
      t.references :active_storage_blobs, null: false, foreign_key: true
      t.string :description
      t.timestamps
    end
  end
end
