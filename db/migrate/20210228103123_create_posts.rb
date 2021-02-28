class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :date
      t.text :contents

      t.timestamps
    end
  end
end
