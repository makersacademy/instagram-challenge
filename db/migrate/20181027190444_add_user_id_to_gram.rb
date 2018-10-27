class AddUserIdToGram < ActiveRecord::Migration[5.2]
  def change
    add_column :grams, :user_id, :integer
  end
end
