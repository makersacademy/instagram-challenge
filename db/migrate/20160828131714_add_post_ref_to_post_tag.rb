class AddPostRefToPostTag < ActiveRecord::Migration[5.0]
  def change
    add_reference :post_tags, :post, foreign_key: true
  end
end
