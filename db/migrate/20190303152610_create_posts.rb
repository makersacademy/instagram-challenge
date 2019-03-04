class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image,           null: false, default: ""
      t.string :description,           null: false, default: ""
      t.timestamps
    end
  end
end
