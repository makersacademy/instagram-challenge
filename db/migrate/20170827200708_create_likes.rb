class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :post, index: true
      t.integer :likecount
      t.timestamps
    end
  end
end
