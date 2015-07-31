class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :my_comment

      t.timestamps null: false
    end
  end
end
