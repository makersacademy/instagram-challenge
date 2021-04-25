class AddUserIdToGrams < ActiveRecord::Migration[6.1]
  def change
    add_reference :grams, :user, null: false, foreign_key: true
  end
end
