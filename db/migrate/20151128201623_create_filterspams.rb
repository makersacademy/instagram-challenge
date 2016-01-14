class CreateFilterspams < ActiveRecord::Migration
  def change
    create_table :filterspams do |t|
      t.text :comment

      t.timestamps null: false
    end
  end
end
