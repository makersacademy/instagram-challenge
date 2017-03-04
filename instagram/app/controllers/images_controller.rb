class ImagesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @images = Image.all
    @users = User.all
    @user = current_user
  end

  def new
    @image = Image.new
  end

  def create
    @user = current_user
    @image = @user.images.new(image_params)
    if @image.save
      redirect_to images_path
    else
      render 'new'
    end
  end

  def show
    if current_user.id == Image.find(params[:id]).user_id
      @user = current_user
      @image = Image.find(params[:id])
    else
      flash[:alert] = 'Cannot edit'
      redirect_to images_path
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @image.update(image_caption)
    redirect_to images_path
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = 'Image deleted successfully'
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:caption, :image)
  end

  def image_caption
    params.require(:image).permit(:caption)
  end

end
