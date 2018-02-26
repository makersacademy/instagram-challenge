class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :caption
      t.string :image
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
