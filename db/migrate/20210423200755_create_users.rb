class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :forename
      t.text :surname
      t.text :username
      t.string :email
      t.string :password
      t.string :profile_picture

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
