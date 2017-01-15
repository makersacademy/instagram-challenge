class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :remarks

      t.timestamps
    end
  end
end
