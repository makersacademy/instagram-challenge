class AddPictureIdToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :picture, index: true, foreign_key: true
  end
end
