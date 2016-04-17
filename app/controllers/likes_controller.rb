class LikesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @picture = Picture.find(params[:picture_id])
    unless @picture.has_been_liked_by?(current_user)
      @like = @picture.likes.create(userid: current_user.id)
    else
      flash[:notice] = 'You cannot like the same picture twice'
    end
    redirect_to picture_path(@picture)
  end

  def destroy
    p params
  end
end
