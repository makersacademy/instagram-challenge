class AddCaptionToGrams < ActiveRecord::Migration[5.2]
  def change
    add_column :grams, :caption, :string
  end
end
