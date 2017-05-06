class AddTravelgramRefToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :travelgram, foreign_key: true
  end
end
