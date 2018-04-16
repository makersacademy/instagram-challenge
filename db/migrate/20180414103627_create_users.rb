class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.datetime :created_on
      t.datetime :current_sign_in
      t.datetime :last_sign_in

      t.timestamps
    end
  end
end
