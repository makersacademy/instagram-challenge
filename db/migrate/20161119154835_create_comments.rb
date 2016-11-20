class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :photo, foreign_key: true

      t.timestamps
    end
  end
end
