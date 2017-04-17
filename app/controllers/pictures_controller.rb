class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params.merge(user: current_user))
    if @picture.save
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def picture_params
    params.require(:picture).permit(:description, :image)
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
     @picture = Picture.find(params[:id])
    if @picture.user != current_user
      redirect_to pictures_path, alert: 'You can only edit description of a picture that you have created'
    end
  end

    def update
    @picture = Picture.find(params[:id])
      @picture.update(picture_params)
      flash[:notice] = 'Description edited successfully'
      redirect_to '/pictures'
  end

   def destroy
    @picture = Picture.find(params[:id])
    if @picture.user == current_user
      @picture.destroy
      flash[:notice] = 'Picture deleted successfully'
      redirect_to '/pictures'
    else
      redirect_to pictures_path, alert: 'You can only delete a pictures that you have created'
    end
  end
end
