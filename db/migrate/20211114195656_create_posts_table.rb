class CreatePostsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
    end
  end
end
