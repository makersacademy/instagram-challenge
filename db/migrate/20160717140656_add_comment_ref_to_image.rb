class AddCommentRefToImage < ActiveRecord::Migration
  def change
    add_reference :images, index: true, foreign_key: true
  end
end
