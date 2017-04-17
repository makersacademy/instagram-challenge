class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)

    if @picture.save
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])

    if @picture.user != current_user
      flash[:notice] = 'You did not add that picture'
      redirect_to '/pictures'
    end
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)

    if @picture.errors.any?
      render 'edit'
    else
      redirect_to '/pictures'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    
    if @picture.user == current_user
      @picture.destroy
      flash[:notice] = 'Picture deleted successfully'
      redirect_to '/pictures'
    else
      flash[:notice] = 'You did not add that picture'
      redirect_to '/pictures'
    end
  end

  def picture_params
    params.require(:picture).permit(:name, :avatar)
  end
end
