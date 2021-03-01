class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
