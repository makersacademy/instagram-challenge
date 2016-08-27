class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, limit: 150
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
