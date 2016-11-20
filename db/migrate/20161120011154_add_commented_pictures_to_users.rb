class AddCommentedPicturesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :picture, foreign_key: true
  end
end
