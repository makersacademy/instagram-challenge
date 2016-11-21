class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new

  end

  def create
    Picture.create(picture_params)
    redirect_to '/pictures'
  end

  def show
    @picture = Picture.find(params[:id])
  end

def edit
  @picture = Picture.find(params[:id])
end

def update
  @picture  = Picture.find(params[:id])
  @picture.update(picture_params)

  redirect_to '/pictures'
end

def destroy
  @picture = Picture.find(params[:id])
  @picture.destroy
  flash[:notice] = "Picture successfully deleted"
  redirect_to '/pictures'
end


private
  def picture_params
    params.require(:picture).permit(:name, :comment, :image)
  end

end
