class AddUserAndPostRefToIrons < ActiveRecord::Migration
  def change
    add_reference :irons, :user, index: true, foreign_key: true
    add_reference :irons, :post, index: true, foreign_key: true
  end
end
