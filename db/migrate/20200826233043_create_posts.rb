class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :image
      t.boolean :active   #poat active/deleted?
      t.references :user
      t.text :text

      t.timestamps
    end
  end
end
