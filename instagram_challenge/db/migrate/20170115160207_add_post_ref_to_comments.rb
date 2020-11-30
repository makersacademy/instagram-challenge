class AddPostRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :post, foreign_key: true
  end
end
