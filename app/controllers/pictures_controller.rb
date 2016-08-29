class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(pictures_params)
    @picture.user = current_user
    if @picture.save
      flash[:success] = "Picture posted!"
      redirect_to pictures_path
    else
      flash[:alert] = "You need to include an image file"
      render :new
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(pictures_params)
    redirect_to pictures_path
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:success] = "Picture deleted!"
    redirect_to pictures_path
  end

  private

  def pictures_params
    params.require(:picture).permit(:image, :description)
  end

end
