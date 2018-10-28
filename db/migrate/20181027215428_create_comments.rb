class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :user_id
      t.integer :message_id

      t.timestamps
    end
  end
end
