class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      # t.text :like

      t.timestamps null: false
    end
  end
end
