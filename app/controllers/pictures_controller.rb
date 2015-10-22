class PicturesController < ApplicationController

before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    if @picture.save
      redirect_to '/pictures'
    else
      render 'new'
    end
  end

  def show
    @picture = Picture.find(params[:id])
    @pictures = Picture.all
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to pictures_path
  end

  def destroy
    @picture = Picture.find(params[:id])

    if destroy_as(@picture.user_id)
      @picture.destroy
      flash[:notice] = 'Picture successfully deleted'
    else
      flash[:notice] = 'Picture not deleted'
    end

    redirect_to pictures_path
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :image)
  end

  def destroy_as(id)
    current_user.id == id
  end
end
