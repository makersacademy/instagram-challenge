class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamp null: false
    end
  end
end
