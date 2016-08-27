class AddFeedRefToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :feed, index: true, foreign_key: true
  end
end
