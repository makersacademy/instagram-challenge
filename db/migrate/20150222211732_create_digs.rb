class CreateDigs < ActiveRecord::Migration
  def change
    create_table :digs do |t|
      t.belongs_to :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :digs, :posts
  end
end
