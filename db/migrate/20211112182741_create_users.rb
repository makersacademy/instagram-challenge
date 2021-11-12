class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.index :email, unique: true

      t.string :password

      t.string :first_name
      t.string :last_name
      t.boolean :admin

      t.timestamps
    end
  end
end
