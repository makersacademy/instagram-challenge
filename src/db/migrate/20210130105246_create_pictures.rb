class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.integer :user_id, :null => false, :references => [:users, :id]
      t.timestamps
    end
  end
end
