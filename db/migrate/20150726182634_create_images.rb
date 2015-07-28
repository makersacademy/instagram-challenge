class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.string :description

      t.timestamps null: false
    end
  end
end
