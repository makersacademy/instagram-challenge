class CreateUsersTableAndAddColumnsToPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.timestamps
    end

    add_reference :posts, :user, foreign_key: true

    add_column :posts, :description, :string
  end
end
