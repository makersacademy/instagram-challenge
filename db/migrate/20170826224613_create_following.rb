class CreateFollowing < ActiveRecord::Migration[5.1]
  def change
    create_table :user_followers do |t|
      t.integer :user_id
      t.integer :follower_id
    end

    add_index "user_followers", ["follower_id"], name: "index_user_followers_on_follower_id", using: :btree
    add_index "user_followers", ["user_id"], name: "index_user_followers_on_user_id", using: :btree
  end
end
