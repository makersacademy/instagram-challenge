class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]


  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
      @picture = Picture.create_with_user(picture_params, current_user)
      if @picture.save
        redirect_to pictures_path
      else
        render 'new'
      end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)

    redirect_to pictures_path
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = 'Picture deleted 😔'
    redirect_to pictures_path
  end

  def picture_params
    params.require(:picture).permit(:description, :image)
  end

end
