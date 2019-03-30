class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
