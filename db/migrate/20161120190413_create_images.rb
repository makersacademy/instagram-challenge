class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.text :url
      t.boolean :like
      t.string :comment

      t.timestamps
    end
  end
end
