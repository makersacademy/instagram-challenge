class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :picture, foreign_key: true
      t.text :content
      t.timestamps
    end
  end
end
