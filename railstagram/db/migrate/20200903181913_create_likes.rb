class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user_id, null: false, foreign_key: true
      t.belongs_to :post_id, null: false, foreign_key: true
      t.belongs_to :comment_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
