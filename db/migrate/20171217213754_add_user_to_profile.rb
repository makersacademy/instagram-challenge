class AddUserToProfile < ActiveRecord::Migration[5.1]
  def change
    add_reference :profiles, :user, foreign_key: true
  end
end
