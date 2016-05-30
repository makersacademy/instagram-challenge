class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.text :reaction

      t.timestamps null: false
    end
  end
end
