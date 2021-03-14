class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.date :date
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
