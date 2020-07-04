class AddMoreFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :gender, :string
    add_column :users, :bio, :text
  end
end
