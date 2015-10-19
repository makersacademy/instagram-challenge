class LikesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.new
    @like.user = current_user
    @like.save
    redirect_to picture_path(@picture)
  end

  def destroy
    #put where in the model as a method. And then call it. like_for(user) for example
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.where(user: current_user)
    @like.destroy

    redirect_to picture_path(@picture)
  end

end
