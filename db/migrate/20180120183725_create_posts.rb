class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.attachment :image
      t.text :desc

      t.timestamps
    end
  end
end
