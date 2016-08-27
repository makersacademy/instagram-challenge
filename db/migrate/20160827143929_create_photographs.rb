class CreatePhotographs < ActiveRecord::Migration
  def change
    create_table :photographs do |t|
      t.string :caption

      t.timestamps null: false
    end
  end
end
