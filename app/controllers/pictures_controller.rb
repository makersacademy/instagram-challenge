class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to '/pictures'
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
    # if @picture.user_id != current_user.id
    #   flash[:notice] = 'Cannot edit photos you did not upload'
      # redirect_to '/pictures'
    # end
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to '/pictures'
  end

  def destroy
    @picture = Picture.find(params[:id])
    # if @picture.user_id == current_user.id
      @picture.destroy
      flash[:notice] = 'Picture deleted successfully'
    # else
    #   flash[:notice] = 'Cannot delete picture you did not upload'
    # end
    redirect_to '/pictures'
  end

  private

  def picture_params
    params.require(:picture).permit(:caption, :image)
  end
end
