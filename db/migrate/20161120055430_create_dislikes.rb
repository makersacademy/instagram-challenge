class CreateDislikes < ActiveRecord::Migration[5.0]
  def change
    create_table :dislikes do |t|
      t.references :post
      t.references :user

      t.timestamps
    end
  end
end
