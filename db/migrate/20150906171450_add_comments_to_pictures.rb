class AddCommentsToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :comment, :string
  end
end
