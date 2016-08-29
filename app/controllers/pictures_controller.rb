class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
   @pictures = Picture.order('created_at')
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.create(picture_params)
      if @picture.save
        flash[:success] = "Your picture has been added successfully"
        redirect_to pictures_path
      else
        render 'new'
      end
  end

  def show
    @picture = Picture.find(params[:id])
  end

private

  def picture_params
    params.require(:picture).permit(:image, :description)
  end

end
