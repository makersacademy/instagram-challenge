class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :picture, foreign_key: true
      t.text :body
    end
  end
end
