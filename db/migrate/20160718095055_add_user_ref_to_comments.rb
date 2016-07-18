class AddUserRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :comments, index: true, foreign_key: true
  end
end
