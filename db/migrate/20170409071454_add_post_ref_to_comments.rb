class AddPostRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :post, index: true, foreign_key: true
  end
end
