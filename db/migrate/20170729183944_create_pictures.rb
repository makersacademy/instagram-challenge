class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :description
      t.datetime :created_at

      t.timestamps
    end
  end
end
