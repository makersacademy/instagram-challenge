class AddPostIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :post, index: true
    add_foreign_key :comments, :posts
  end
end
