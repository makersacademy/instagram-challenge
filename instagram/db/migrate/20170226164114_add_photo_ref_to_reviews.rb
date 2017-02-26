class AddPhotoRefToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :photo, foreign_key: true
  end
end
