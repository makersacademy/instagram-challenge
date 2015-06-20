class PicturesController < ApplicationController

  def index
    if params[:search]
      @pictures = Picture.search(params[:search]).order("created_at DESC")
    else
      @pictures = Picture.order("created_at DESC")
    end
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    if @picture.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @picture = Picture.find(params[:title])
  end

  def destroy
    @picture = Picture.find(params[:id])
    if @picture.user_id == current_user.id
      @picture.destroy
      flash[:notice] = 'Picture deleted'
      redirect_to '/'
    else
      flash[:notice] = 'You may not delete this'
      redirect_to '/'
    end
  end

  def picture_params
    params.require(:picture).permit(:image, :title)
  end

end
