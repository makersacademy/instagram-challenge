class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.text :link
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :pictures, [:user_id, :created_at]
  end
end
