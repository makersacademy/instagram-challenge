class LikesController < ApplicationController
  def new
    @picture = Picture.find(params[:picture_id])
    @like = Like.new
  end

  def index
   @likes = Like.all
   redirect_to pictures_path
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.build_with_user like_params, current_user
    if @like.save
      redirect_to pictures_path
    else
      render :new
    end
  end

  private

  def like_params
    # how to set this to true?
    params.require(:like).permit(:liked)
  end

end
