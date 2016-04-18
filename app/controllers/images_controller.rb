class ImagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    Image.save_with_current_user(restaurant_params, current_user)
    redirect_to ('/images')
  end

  def show
    @images = Image.all_from_a_user(params[:id])
  end

  def destroy
    Image.delete(params[:id])
    flash[:notice] = 'Image was removed'
    redirect_to('/')
  end

  def upvote
    @image = Image.find(params[:id])
    @image.upvote_by current_user
    redirect_to ('/')
  end

  def restaurant_params
    params.require(:image).permit(:name, :description, :image)
  end
end
