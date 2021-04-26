class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password, null: false
      t.string :forename, null: false
      t.string :lastname, null: false

      t.timestamps
    end
  end
end



