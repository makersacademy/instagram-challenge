class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
  end
end
