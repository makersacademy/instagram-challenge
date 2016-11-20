class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @user = User.find(current_user.id)
    @picture = @user.pictures.build(picture_params)
    if @picture.save
      redirect_to(picture_path(@picture))
    else
      flash.now[:errors] = ["You need to have an image to post!!"]
      render :new
    end
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
    redirect_to picture_path(@picture)
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Picture has been deleted'
    redirect_to '/pictures'
  end

private

  def picture_params
    params.require(:picture).permit(:image, :caption, :user_id)
  end
end
