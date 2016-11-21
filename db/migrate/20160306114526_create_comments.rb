class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comments

      t.timestamps null: false
    end
  end
end
