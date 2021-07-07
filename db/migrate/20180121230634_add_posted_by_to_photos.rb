class AddPostedByToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :posted_by, :text
  end
end
