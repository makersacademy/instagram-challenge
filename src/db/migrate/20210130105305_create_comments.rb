class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id, :null => false, :references => [:users, :id]
      t.integer :picture_id, :null => false, :references => [:pictures, :id]
      t.string :message
      t.timestamps
    end
  end
end
