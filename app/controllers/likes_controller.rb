class LikesController < ApplicationController
  def new
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.create
    @like.user = current_user

    if @like.save
      flash[:notice] = 'Picture liked'
      redirect_to("/")
    else
      if @like.errors[:user]
        redirect_to "/", alert: 'You liked this picture already'
      else
        render :new
      end
    end
  end


end
