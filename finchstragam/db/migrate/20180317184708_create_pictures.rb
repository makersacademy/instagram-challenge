class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :link
      t.string :description
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
