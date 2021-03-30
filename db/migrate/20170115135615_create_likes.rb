class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.belongs_to :image, foreign_key: true

      t.timestamps
    end
  end
end
