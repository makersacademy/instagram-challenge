class CreateGrams < ActiveRecord::Migration[5.2]
  def change
    create_table :grams do |t|
      t.string :caption
      t.string :image

      t.timestamps
    end
  end
end
