class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all.order("created_at DESC")
  end

  def new
    @picture = current_user.pictures.build
  end

  def create
    @picture = current_user.pictures.build(picture_params)

    if @picture.save
      redirect_to pictures_path, notice: "Successfully created a Picture"
    else
      render 'new'
    end
  end

  def show
    find_picture
  end

  def destroy
    find_picture
    @picture.destroy
    redirect_to '/pictures'
  end

  private

    def picture_params
      params.require(:picture).permit(:image) if params[:picture]
    end

    def find_picture
      @picture = Picture.find(params[:id])
    end
end
