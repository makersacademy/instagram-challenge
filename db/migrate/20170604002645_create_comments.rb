class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :image_id
      t.text :body
      t.timestamps
    end
  end
end
