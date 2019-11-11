class CreatePics < ActiveRecord::Migration[6.0]
  def change
    create_table :pics do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
