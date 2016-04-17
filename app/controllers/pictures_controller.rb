class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    if @picture.save
      flash[:success] = 'Your picture has been posted!'
      redirect_to @picture
    else
      flash[:alert] = 'Woa there, you have to upload an image!'
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
    flash[:success] = 'Picture updated!'
    redirect_to picture_path(@picture)
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:success] = 'Your picture has been deleted'
    redirect_to pictures_path
  end

  def picture_params
    params.require(:picture).permit(:caption, :image)
  end

end
