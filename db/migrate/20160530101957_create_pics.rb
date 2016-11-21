class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
