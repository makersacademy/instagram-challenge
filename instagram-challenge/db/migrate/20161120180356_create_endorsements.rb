class CreateEndorsements < ActiveRecord::Migration[5.0]
  def change
    create_table :endorsements do |t|
      t.belongs_to :picture, foreign_key: true

      t.timestamps
    end
  end
end
