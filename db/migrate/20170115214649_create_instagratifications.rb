class CreateInstagratifications < ActiveRecord::Migration[5.0]
  def change
    create_table :instagratifications do |t|
      t.belongs_to :picture, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
