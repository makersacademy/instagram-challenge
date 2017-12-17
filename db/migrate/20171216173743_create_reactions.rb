class CreateReactions < ActiveRecord::Migration[5.1]
  def change
    create_table :reactions do |t|
      t.text :comment
      t.integer :like

      t.timestamps
    end
  end
end
