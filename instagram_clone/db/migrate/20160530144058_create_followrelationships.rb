class CreateFollowrelationships < ActiveRecord::Migration
  def change
    create_table :followrelationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
    add_index :followrelationships, :follower_id
    add_index :followrelationships, :followed_id
    add_index :followrelationships, [:follower_id, :followed_id], unique: true
  end
end
