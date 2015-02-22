class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :picture, index: true

      t.timestamps null: false
    end
    add_foreign_key :likes, :pictures
  end
end
