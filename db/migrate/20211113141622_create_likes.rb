class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.string :user_id
      t.string :post_id

      t.timestamps
    end
  end
end
