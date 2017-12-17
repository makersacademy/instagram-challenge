class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.text :password
      t.text :password_confirmation

      t.timestamps
    end
  end
end
