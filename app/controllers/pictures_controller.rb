class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    user = current_user
    @picture = user.pictures.create(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      flash[:notice] = 'you must select a picture!'
      render 'new'
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
    @picture.update(picture_params)

    redirect_to '/pictures'
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'this post has been deleted'
    redirect_to '/pictures'
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :caption)
  end
end
