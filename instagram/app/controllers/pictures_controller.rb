class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.save
    redirect_to pictures_path
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = "Picture deleted"
    redirect_to "/"
  end


  def picture_params
    params.require(:picture).permit(:caption, :image)
  end

end
