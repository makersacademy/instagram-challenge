class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
