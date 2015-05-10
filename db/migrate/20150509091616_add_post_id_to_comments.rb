class AddPostIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :posts, index: true, foreign_key: true
  end
end
