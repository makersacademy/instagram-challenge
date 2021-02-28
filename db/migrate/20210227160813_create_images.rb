class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :title
      t.text :comment
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
