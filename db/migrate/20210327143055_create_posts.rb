class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.binary :image
      t.string :caption
      t.string :user

      t.timestamps
    end
  end
end
