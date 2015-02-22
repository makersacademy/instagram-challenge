class AddUserToDigs < ActiveRecord::Migration
  def change
    add_reference :digs, :user, index: true
    add_foreign_key :digs, :users
  end
end
