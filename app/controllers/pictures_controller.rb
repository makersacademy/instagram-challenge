class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
   @pictures = Picture.order('created_at')
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
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

  def destroy
    @picture = Picture.find(params[:id])
    if @picture.user.id != current_user.id
      flash[:notice] =  "You are not allowed to delete another user's picture"
    else
      @picture.delete
      flash[:notice] = 'Picture deleted successfully'
    end
    redirect_to pictures_path
  end

private

  def picture_params
    params.require(:picture).permit(:image, :description)
  end

end
