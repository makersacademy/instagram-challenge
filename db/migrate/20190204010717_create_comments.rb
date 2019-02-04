class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :post, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
