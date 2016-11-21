class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :thoughts
      t.references :pic, foreign_key: true

      t.timestamps
    end
  end
end
