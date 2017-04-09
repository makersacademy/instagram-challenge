class PicturesController < ApplicationController
  # before_action :authenticate_user!
  respond_to :js, :html
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    redirect_to '/pictures'
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
    redirect_to "/pictures"
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Deleted post'
    redirect_to '/pictures'
  end

  def like
    if !current_user.liked? @picture
      @picture.liked_by current_user
    elsif current_user.liked? @picture
      @picture.unliked_by current_user
    end
  end
  private

  def picture_params
    params.require(:picture).permit(:title, :filename)
  end

end
