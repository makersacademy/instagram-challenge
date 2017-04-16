class AddPostIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :post, :belong_to
  end
end
