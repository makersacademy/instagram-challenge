class AddLikesToGrams < ActiveRecord::Migration[6.1]
  def change
    add_column :grams, :likes, :integer
  end
end
