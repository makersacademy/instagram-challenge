class AddColumnsToUserClass < ActiveRecord::Migration[6.1]
  def change
    change_table(:users) do |t|
      t.string :first_name, limit: 30
      t.string :last_name, limit: 30
      t.string :username, limit: 20
      t.date :date_of_birth
      t.string :email, limit: 50
      t.string :password_digest
      t.string :image_data

    end 
  end
end
