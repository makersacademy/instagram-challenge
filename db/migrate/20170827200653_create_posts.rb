class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.text :imagepath
      t.string :caption
      t.timestamps
    end
  end
end
