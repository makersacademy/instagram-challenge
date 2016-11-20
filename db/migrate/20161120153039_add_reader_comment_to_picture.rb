class AddReaderCommentToPicture < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :rcomment, :text
  end
end
