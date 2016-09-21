class CreateAdmirations < ActiveRecord::Migration[5.0]
  def change
    create_table :admirations do |t|
      t.belongs_to :photograph, foreign_key: true

      t.timestamps
    end
  end
end
