class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :userid

      t.timestamps null: false
    end
  end
end
