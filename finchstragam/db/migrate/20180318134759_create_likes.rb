class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :number_of_likes
      t.belongs_to :user, foreign_key: true
      t.belongs_to :picture, foreign_key: true

      t.timestamps
    end
  end
end
