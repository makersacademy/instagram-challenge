class PicturesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :your_picture, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = User.find(current_user.id).pictures.build(pic_params)
    if @picture.save
      redirect_to pictures_url
    else
      flash[:notice] = @picture.errors.full_messages
      redirect_to new_picture_url
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    Picture.find(params[:id]).update(pic_params)
    flash[:notice] = "Picture edited!"
    redirect_to current_user
  end

  def destroy
    Picture.find(params[:id]).destroy
    flash[:notice] = "Picture gone!"
    redirect_to current_user
  end

  private

  def pic_params
    params.require(:picture).permit(:image, :caption)
  end

  def your_picture
    @picture = Picture.find(params[:id])
    unless current_user.id == @picture.user.id
      flash[:alert] = "That picture isn't yours!"
      redirect_to current_user
    end
  end

end
