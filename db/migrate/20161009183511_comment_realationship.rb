class CommentRealationship < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :user, foriegn_key: true
    add_reference :comments, :photo, foriegn_key: true
  end
end
