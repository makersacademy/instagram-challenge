class AddUserToFatcats < ActiveRecord::Migration[6.0]
  def change
    add_reference :fatcats, :user
  end
end
