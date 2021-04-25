class CreatePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :image
      t.boolean :active
      t.references :user
      t.timestamps
    end
  end
end
 