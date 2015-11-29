class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
