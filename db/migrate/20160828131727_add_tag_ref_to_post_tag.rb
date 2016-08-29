class AddTagRefToPostTag < ActiveRecord::Migration[5.0]
  def change
    add_reference :post_tags, :tag, foreign_key: true
  end
end
