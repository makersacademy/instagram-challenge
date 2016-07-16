class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :picture
      t.string :comment
      t.boolean :like

      t.timestamps
    end
  end
end
