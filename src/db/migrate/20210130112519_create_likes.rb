class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :user_id, :null => false, :references => [:users, :id]
      t.integer :picture_id, :null => false, :references => [:pictures, :id]
      t.timestamps
    end
    add_index :likes, [:user_id, :picture_id], unique: true
  end
end
