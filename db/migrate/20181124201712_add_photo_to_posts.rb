class AddPhotoToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :photo, :string
  end
end
