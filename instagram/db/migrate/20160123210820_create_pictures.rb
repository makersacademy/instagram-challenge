class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :user_name
      t.string :comments
      t.boolean :like

      t.timestamps null: false
    end
  end
end
