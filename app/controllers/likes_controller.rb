class LikesController < ApplicationController
  def new
  end

  def create
    @like = Like.new(like_params)

    if @like.save
      redirect_to '/pictures'
    else
      render '/pictures'
    end
  end

  private
    def like_params
      params.require(:like).permit(:picture_id, :user_id)
    end

end
