class CreatePics < ActiveRecord::Migration[6.0]
  def change
    create_table :pics do |t|
      t.text :comment

      t.timestamps
    end
  end
end
