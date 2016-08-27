class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|

      t.timestamps null: false
    end
  end
end
