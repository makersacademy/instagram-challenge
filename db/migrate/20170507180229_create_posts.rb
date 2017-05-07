class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :description
      t.belongs_to :profile, foreign_key: true

      t.timestamps
    end
  end
end
