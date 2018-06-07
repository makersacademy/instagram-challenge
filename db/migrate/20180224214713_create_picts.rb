class CreatePicts < ActiveRecord::Migration[5.1]
  def change
    create_table :picts do |t|
      t.string :title, null: false
      t.string :hints
      t.string :answer

      t.timestamps
    end
  end
end
