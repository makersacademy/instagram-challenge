class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :forename
      t.text :surname
      t.text :username
      t.string :email
      t.string :password_digest
      t.string :profile_picture

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
