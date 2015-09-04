class LikesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def create 
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.build(user: current_user)

    if @like.save
      redirect_to pictures_path
    else
      if @like.errors[:user]
        flash[:notice] = 'You have already liked this picture'
        redirect_to pictures_path
      else
        render :new
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    
    if current_user.reviews.include?(@review)
      @review.destroy
      flash[:notice] = 'Review deleted successfully'
      redirect_to '/restaurants'
    else
      flash[:notice] = 'You did not add that review'
      redirect_to '/restaurants'
    end
  end
end
