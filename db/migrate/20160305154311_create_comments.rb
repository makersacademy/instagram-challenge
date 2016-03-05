class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, limit: 200
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
