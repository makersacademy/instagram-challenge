class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find params[:id]
  end

  def new
    @picture = Picture.new
  end

  def create
    picture = Picture.new( picture_params )
    
    if picture.save 
     redirect_to pictures_path 
     else
      render "new"
    end
  end

  def destroy
    picture = Picture.find params[:id]

    if picture.delete_picture_if current_user
      flash[:notice] = 'Picture deleted successfully'
    else
      flash[:notice] = "Picture can't be deleted"
    end

    redirect_to pictures_path 
  end

  private

  def picture_params
    params[:picture][:user_id] = current_user.id
    params.require(:picture).permit(:image, :title, :user_id)
  end
end
