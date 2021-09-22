class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, limit: 30
      t.string :email, limit: 100
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
