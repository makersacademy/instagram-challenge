class ReviewsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @review = Review.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.reviews.create(review_params)
    redirect_to pictures_path
  end

  def review_params
    params.require(:review).permit(:thoughts)
  end
end
