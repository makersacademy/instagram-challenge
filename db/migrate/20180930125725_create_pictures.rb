class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.references :user, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
