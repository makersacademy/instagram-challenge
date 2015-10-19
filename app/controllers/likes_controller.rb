class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.build
    @like.user = current_user

    if @picture.liked_by?(current_user)
      flash[:notice] = 'Cannot like the same picture twice'
    else
      @like.save
    end
      redirect_to picture_path(@picture)
  end

  def destroy
    #put where in the model as a method. And then call it. like_for(user) for example
    @picture = Picture.find(params[:picture_id])
    @like = Like.find(params[:id])
    # @like = @picture.find_like(current_user)
    @like.destroy

    redirect_to picture_path(@picture)
  end

end
