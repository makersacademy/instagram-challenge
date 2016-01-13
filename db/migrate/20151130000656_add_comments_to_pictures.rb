class AddCommentsToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :comments, :string
  end
end
