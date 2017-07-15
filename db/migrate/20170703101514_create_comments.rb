class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|

      t.string :body, null: false

      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamp null: false
    end
  end
end
