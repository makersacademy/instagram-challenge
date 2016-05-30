class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :likeable, polymorphic: true, index: true
      t.timestamps null: false
    end
    
    add_reference :likes, :user, index: true, foreign_key: true
  end
end
