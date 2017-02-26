class ReviewsController < ApplicationController
  def new
    @photo = Photo.find(params[:photo_id])
    @review = Review.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    review = @photo.reviews.new(review_params)
    # review['user_id'] = current_user.id
    review.save
    path = "/photos/#{@photo.id}"
    redirect_to path
  end

private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
