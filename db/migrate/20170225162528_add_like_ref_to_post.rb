class AddLikeRefToPost < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :like, foreign_key: true
  end
end
