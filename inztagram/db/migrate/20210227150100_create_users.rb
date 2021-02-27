class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email, null: false

      t.timestamps
    end
  end
end

# rails db:migrate:redo -> use this when you update the table 