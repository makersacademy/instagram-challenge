class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :liked

      t.timestamps null: false
    end
  end
end
