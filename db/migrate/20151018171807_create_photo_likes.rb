class CreatePhotoLikes < ActiveRecord::Migration
  def change
    create_table :photo_likes do |t|

      t.timestamps null: false
    end
  end
end
