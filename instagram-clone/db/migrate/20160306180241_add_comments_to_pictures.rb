class AddCommentsToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :description, :text
  end
end
