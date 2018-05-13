class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :photo
      t.text :desc

      t.timestamps
    end
  end
end
