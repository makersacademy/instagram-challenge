class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, index: { unique: true}
      t.string :email, null: false, index: { unique: true}
      t.string :password_digest, null: false
    end
    add_foreign_key :pictures, :users
    add_foreign_key :likes, :users
    add_foreign_key :comments, :users
    add_foreign_key :likes, :pictures
    add_foreign_key :comments, :pictures
  end
end
