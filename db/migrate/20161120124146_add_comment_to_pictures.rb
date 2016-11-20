class AddCommentToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :comment, :text
  end
end
