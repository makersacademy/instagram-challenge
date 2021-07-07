class CreateTweetts < ActiveRecord::Migration[6.1]
  def change
    create_table :tweetts do |t|
      t.text :content
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
