class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user
      t.text :message

      t.text :content_type
      t.binary :picture

      t.timestamps
    end
  end
end
