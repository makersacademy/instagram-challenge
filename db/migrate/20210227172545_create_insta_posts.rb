class CreateInstaPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :insta_posts do |t|
      t.string :name
      t.text :comment
      t.string :picture

      t.timestamps
    end
  end
end
