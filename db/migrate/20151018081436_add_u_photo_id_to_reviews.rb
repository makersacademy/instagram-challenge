class AddUPhotoIdToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :photo, index: true, foreign_key: true
  end
end
