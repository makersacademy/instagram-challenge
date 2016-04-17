class LikesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    like_current_picture
  end

  def destroy
    unlike_current_picture
  end

  private

  def like_current_picture
    @picture = Picture.find(params[:picture_id])
    unless @picture.has_been_liked_by?(current_user)
      @picture.likes.create(userid: current_user.id)
    else
      flash[:notice] = 'You cannot like the same picture twice'
    end
    redirect_to picture_path(@picture)
  end

  def unlike_current_picture
    @picture = Picture.find(params[:id])
    @picture.likes.each {|like| like.destroy if like.userid == current_user.id}
    redirect_to picture_path(@picture)
  end
end
