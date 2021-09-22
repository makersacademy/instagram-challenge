class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :follow

      t.timestamps
    end
    add_index :friends, %i[user_id follow], unique: true
  end
end
