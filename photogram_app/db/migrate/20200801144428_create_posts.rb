class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    change_table :posts do |t|
      t.text :text
      t.references :user, null: false, foreign_key: true
      t.integer :user_id
      
      t.timestamps
    end
  end
end
