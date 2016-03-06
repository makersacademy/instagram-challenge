class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    # @picture = Picture.new(picture_params)
    @picture = current_user.pictures.new(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def picture_params
    params.require(:picture).permit(:postcomment)
  end

  def edit
    @picture = Picture.find(params[:id])
    if !(current_user == @picture.user)
      redirect_to '/pictures'
      flash[:notice] = 'Only the owner of this picture can edit it!'
    end

  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to '/pictures'
  end

  def destroy
    @picture = Picture.find(params[:id])
    if !(current_user == @picture.user)
      redirect_to '/pictures'
      flash[:notice] = 'Only the owner of this picture can delete it!'
    else
      @picture.destroy
      flash[:notice] = 'Picture deleted successfully'
      redirect_to '/pictures'
    end
  end
end
