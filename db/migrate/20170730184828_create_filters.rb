class CreateFilters < ActiveRecord::Migration[5.0]
  def change
    create_table :filters do |t|
      t.belongs_to :picture, foreign_key: true
      t.belongs_to :tag, foreign_key: true
      t.timestamps
    end
  end
end
