class AddUserRefToTravelgrams < ActiveRecord::Migration[5.1]
  def change
    add_reference :travelgrams, :user, foreign_key: true
  end
end
