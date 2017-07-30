class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    # @image = Image.new(image_params)
    # if @image.save
    #   flash[:success] = "Posted!"
    #   redirect_to images_path
    # else
    #   flash[:notice] = "Epic Fail..."
    # end
    Image.create(image_params)
    redirect_to images_path
  end

  def show
    @image = Image.find(params[:id])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @image.update(image.params)
    redirect_to images_path
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:image, :title)
  end
end
