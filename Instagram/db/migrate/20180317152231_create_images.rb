class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :user
      t.text :caption

      t.timestamps
    end
  end
end
