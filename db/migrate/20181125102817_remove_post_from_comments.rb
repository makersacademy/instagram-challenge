class RemovePostFromComments < ActiveRecord::Migration[5.1]
  remove_column :comments, :post_id
end
