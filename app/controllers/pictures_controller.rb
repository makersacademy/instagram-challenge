class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
    @comments = @picture.comments
  end

  def new
    @picture = Picture.new
  end

  def create
    @user = current_user
    @picture = @user.pictures.new(picture_params)
    if @picture.save
			redirect_to pictures_path
		else
			render 'new'
		end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to '/pictures'
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Picture deleted successfully'
    redirect_to '/pictures'
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :description)
  end

end
