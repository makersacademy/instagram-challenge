class AddUserRefToCreateComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :create_comments, :user, foreign_key: true
  end
end
