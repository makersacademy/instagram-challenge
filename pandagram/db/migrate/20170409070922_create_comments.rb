class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :user_comment

      t.timestamps null: false
    end
  end
end
