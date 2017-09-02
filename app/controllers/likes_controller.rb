class LikesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def create
    @photograph = Photograph.find(params[:photograph_id])
    @like = current_user.likes.new
    @photograph.likes << @like
    @like.save
  end

  def destroy
    @photograph = Photograph.find(params[:photograph_id])
    redirect_to '/'
  end

end
