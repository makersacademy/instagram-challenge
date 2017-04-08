class ImagesController < ApplicationController

  before_action :find_image, only: [:edit, :show, :update, :destroy]

  def index 
    @images = Image.all.order("created_at DESC")
  end 

  def show 
  end 

  def new 
    #Want to make sure the new image is created by the CURRENT USER
    @image = current_user.images.build
  end 

  def create 
    #Want to make sure the new image is created by the CURRENT USER
    @image = current_user.images.build(image_params)

    if @image.save 
      redirect_to @image, notice: "Your image was posted!"
    else 
      render 'new'
    end 
  end 

  def edit 

  end 

  def update 
    if @image.update(image_params)
      redirect_to @image, notice: "Your image was updated"
    else 
      render 'edit'
    end 
  end 

  def destroy
    @image.destroy 
    redirect_to root_path
  end 

  private 

  def image_params 
    params.require(:image).permit(:title, :description)
  end 

  def find_image
    @image = Image.find(params[:id])
  end 

end
