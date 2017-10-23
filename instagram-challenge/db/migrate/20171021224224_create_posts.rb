class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      # t.string :content
      t.string :content

      t.timestamps
    end
  end
end
