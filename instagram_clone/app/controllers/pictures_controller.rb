class PicturesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @pictures = Picture.order('created_at')
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      flash[:success] = "The picture was added!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:success] = "The picture was destroyed."
    redirect_to root_path
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :title)
  end
end
