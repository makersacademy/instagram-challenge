class AddCommentIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :comment, index: true, foreign_key: true
  end
end
