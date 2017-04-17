class CreateCommentLikes < ActiveRecord::Migration
  def change
    create_table :comment_likes do |t|

      t.timestamps null: false
    end
  end
end
