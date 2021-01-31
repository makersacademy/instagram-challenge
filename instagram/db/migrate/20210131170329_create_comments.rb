class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :text
      t.belongs_to :post, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
