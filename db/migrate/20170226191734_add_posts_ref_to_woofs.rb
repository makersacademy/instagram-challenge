class AddPostsRefToWoofs < ActiveRecord::Migration[5.0]
  def change
    add_reference :woofs, :post, foreign_key: true
  end
end
