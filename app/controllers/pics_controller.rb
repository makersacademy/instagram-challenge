class PicsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @moments = Pic.all
  end

  def new
    @moment = Pic.new
  end

  def create
    @moment = Pic.create(pic_params)
    if @moment.save
      redirect_to '/pics'
    else
      render 'new'
    end
  end

  def show
    @moment = Pic.find(params[:id])
  end

  def pic_params
    params.require(:pic).permit(:title, :image)
  end

  def destroy
    @moment = Pic.find(params[:id])
    @moment.destroy
    flash[:notice] = 'Moment deleted successfully'
    redirect_to '/pics'
  end

  def upvote
    @link = Pic.find(params[:id])
    @link.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @link = Pic.find(params[:id])
    @link.downvote_by current_user
    redirect_to :back
  end
end
