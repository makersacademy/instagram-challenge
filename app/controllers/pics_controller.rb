class PicsController < ApplicationController
  def index
    authenticate_user!
    @pics = Pic.order("created_at DESC")
  end

  def new
    unless user_signed_in?
      flash[:notice] = "You must be logged in to do that"
      redirect_to pics_path
    end
    @pic = Pic.new
  end

  def create
    pic = Pic.create(pic_params.merge(user_id: current_user.id))
    if pic.save
      redirect_to pics_path
    else
      render 'new'
    end
  end

  private
  
  def pic_params
    params.require(:pic).permit(:image)
  end
end
