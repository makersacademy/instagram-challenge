class AddCommentsToPictures < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :picture, index: true
    add_foreign_key :comments, :pictures
  end
end
