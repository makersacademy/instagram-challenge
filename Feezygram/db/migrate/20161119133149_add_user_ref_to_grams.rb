class AddUserRefToGrams < ActiveRecord::Migration[5.0]
  def change
    add_reference :grams, :user, foreign_key: true
  end
end
