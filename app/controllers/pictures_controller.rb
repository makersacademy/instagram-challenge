class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    unless current_user
      flash[:alert] = "You have to be signed in to add a picture"
      redirect_to '/users/sign_in'
    end
    @picture = Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to '/pictures'
  end

  def show
    @picture = Picture.find(params[:id])
    @comment = Comment.new
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
    flash[:notice] = "Picture has been deleted succesfully"
    redirect_to '/pictures'
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :description)
  end

end
