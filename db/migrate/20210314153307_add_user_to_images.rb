class AddUserToImages < ActiveRecord::Migration[6.1]
  def change
    add_reference :images, :user, null: false, foreign_key: true
  end
end
