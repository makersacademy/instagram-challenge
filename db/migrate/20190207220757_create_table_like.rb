class CreateTableLike < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
