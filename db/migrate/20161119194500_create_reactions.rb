class CreateReactions < ActiveRecord::Migration[5.0]
  def change
    create_table :reactions do |t|
      t.belongs_to :photo, foreign_key: true

      t.timestamps
    end
  end
end
