class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
    @comment = Comment.new
  end

  def new
    @picture = Picture.new
  end

  def create
    picture = current_user.pictures.new(picture_params)
    if picture.save
      redirect_to '/pictures'
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    picture = Picture.find(params[:id])
    if current_user == picture.user
      picture.destroy
      flash[:notice] = 'picture deleted'
      redirect_to '/pictures'
    end 
  end

  def picture_params
    params.require(:picture).permit(:caption, :image)
  end

end
